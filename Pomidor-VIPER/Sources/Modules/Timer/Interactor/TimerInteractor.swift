//
//  TimerInteractor.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

protocol TimerInteractorInput: AnyObject {
    var isWorkTime: Bool { get set }
    var isStarted: Bool { get set }
    var isAnimationStarted: Bool { get set }
    var workTime: Int { get set}
    var restTime: Int { get set}

    init(presenter: TimerInteractorOutput)

    func provideInitializeTimerData()
    func provideTimerDataForCountDown()
    func provideData()
    func toggleIsWorkTime()
    func toggleIsStarted()
    func toggleIsAnimationStarted()
    func changeTimerSettings(workTime: Int, restTime: Int)
}

protocol TimerInteractorOutput: AnyObject {
    func receiveInitializeTimerData(with timerData: TimerData)
    func receiveTimerDataForCountDown(with timerData: TimerData)
    func updateInternalData(with timerData: TimerData)
}

class TimerInteractor: TimerInteractorInput {

    unowned let presenter: TimerInteractorOutput
    private var timer: TimerEntity

    var isWorkTime: Bool {
        get {
            timer.isWorkTime
        } set {
            timer.isWorkTime.toggle()
        }
    }

    var isStarted: Bool {
        get {
            timer.isStarted
        } set {
            timer.isStarted.toggle()
        }
    }

    var isAnimationStarted: Bool {
        get {
            timer.isAnimationStarted
        } set {
            timer.isAnimationStarted.toggle()
        }
    }

    var workTime: Int {
        get {
            timer.workTime
        } set {
            timer.workTime = newValue
        }
    }

    var restTime: Int {
        get {
            timer.restTime
        } set {
            timer.restTime = newValue
        }
    }

    required init(presenter: TimerInteractorOutput) {
        self.presenter = presenter
        self.timer = TimerEntity()
    }

    func provideData() {
        presenter.updateInternalData(with: getDataFromEnity())
    }

    func provideInitializeTimerData() {
        presenter.receiveInitializeTimerData(with: getDataFromEnity())
    }

    func provideTimerDataForCountDown() {
        presenter.receiveTimerDataForCountDown(with: getDataFromEnity())
    }

    private func getDataFromEnity() -> TimerData  {
        let timerData = TimerData(isWorkTime: timer.isWorkTime,
                                            isStarted: timer.isStarted,
                                            isAnimationStarted: timer.isAnimationStarted,
                                            workTime: timer.workTime,
                                            restTime: timer.restTime)
        return timerData
    }

    func toggleIsWorkTime() {
        isWorkTime.toggle()
    }

    func toggleIsStarted() {
        isStarted.toggle()
    }

    func toggleIsAnimationStarted() {
        isAnimationStarted.toggle()
    }

    func changeTimerSettings(workTime: Int, restTime: Int) {
        self.workTime = workTime
        self.restTime = restTime
    }
}

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

    init(presenter: TimerInteractorOutput)

    func provideInitializeTimerData()
    func provideTimerDataForCountDown()
    func provideData()
    func toggleIsWorkTime()
    func toggleIsStarted()
    func toggleIsAnimationStarted()
}

protocol TimerInteractorOutput: AnyObject {
    func receiveInitializeTimerData(with timerData: TimerData)
    func receiveTimerDataForCountDown(with timerData: TimerData)
    func updateInternalData(with timerData: TimerData)
}

class TimerInteractor: TimerInteractorInput {

    unowned let presenter: TimerInteractorOutput
    private var timer = TimerEntity.timer

    var isWorkTime: Bool {
        get {
            TimerEntity.timer.isWorkTime
        } set {
            TimerEntity.timer.isWorkTime = newValue
        }
    }

    var isStarted: Bool {
        get {
            TimerEntity.timer.isStarted
        } set {
            TimerEntity.timer.isStarted = newValue
        }
    }

    var isAnimationStarted: Bool {
        get {
            TimerEntity.timer.isAnimationStarted
        } set {
            TimerEntity.timer.isAnimationStarted = newValue
        }
    }

    required init(presenter: TimerInteractorOutput) {
        self.presenter = presenter
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
        let timerData = TimerData(isWorkTime: TimerEntity.timer.isWorkTime,
                                  isStarted: TimerEntity.timer.isStarted,
                                  isAnimationStarted: TimerEntity.timer.isAnimationStarted,
                                  workTime: TimerEntity.timer.workTime,
                                  restTime: TimerEntity.timer.restTime)
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
}

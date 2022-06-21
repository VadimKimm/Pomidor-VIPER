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


    init(presenter: TimerInteractorOutput)

    func provideTimer()
    func toggleIsWorkTime()
    func toggleIsStarted()
}

protocol TimerInteractorOutput: AnyObject {
    func receiveTimer(with timerData: TimerData)
    func receiveTimerMode(isWorkTime: Bool)
    func receiveTimerState(isStarted: Bool)
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

    required init(presenter: TimerInteractorOutput) {
        self.presenter = presenter
        self.timer = TimerEntity()
    }

    func provideTimer() {
        let timerData = TimerData(timerLabel: timer.workTime,
                                  isWorkTime: timer.isWorkTime,
                                  isStarted: timer.isStarted)
        presenter.receiveTimer(with: timerData)
    }

    func toggleIsWorkTime() {
        isWorkTime.toggle()
        presenter.receiveTimerMode(isWorkTime: isWorkTime)
    }

    func toggleIsStarted() {
        isStarted.toggle()
        presenter.receiveTimerState(isStarted: isStarted)
    }

}

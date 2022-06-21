//
//  TimerInteractor.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

protocol TimerInteractorInput: AnyObject {
    var isWorkTime: Bool { get set }

    init(presenter: TimerInteractorOutput)

    func provideTimer()
}

protocol TimerInteractorOutput: AnyObject {
    func receiveTimer(with timerData: TimerData)
    func receiveTimerMode(isWorkTime: Bool)
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

    required init(presenter: TimerInteractorOutput) {
        self.presenter = presenter
        self.timer = TimerEntity()
    }

    func provideTimer() {
        let timerData = TimerData(timerLabel: timer.workTime,
                                  isWorkTime: timer.isWorkTime)
        presenter.receiveTimer(with: timerData)
    }

}

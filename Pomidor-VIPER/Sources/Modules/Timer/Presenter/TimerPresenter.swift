//
//  TimerPresenter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

struct TimerData {
    let timerLabel: Int
    let isWorkTime: Bool
    let isStarted: Bool
}

class TimerPresenter: TimerViewOutput {

    unowned let view: TimerViewInput
    var interactor: TimerInteractorInput!
    var router: TimerRouter!

    required init(view: TimerViewInput) {
        self.view = view
    }

    func showDetails() {
        interactor.provideTimer()
    }

    func startPauseButtonTapped() {
//        interactor.toggleIsWorkTime()
        interactor.toggleIsStarted()
    }
}

//MARK: - TimerInteractorOutput -
extension TimerPresenter: TimerInteractorOutput {

    func receiveTimer(with timerData: TimerData) {
        let time = timerData.timerLabel
        let timerLabelTextForWork = String("\(time < 10 ? "0\(time):00" : "\(time):00")")

        view.displayTimerLabel(with: timerLabelTextForWork)
        view.dislpayStartPauseButton(forModeIswork: timerData.isWorkTime)
    }

    func receiveTimerMode(isWorkTime: Bool) {
        view.dislpayStartPauseButton(forModeIswork: isWorkTime)
    }

    func receiveTimerState(isStarted: Bool) {
        view.changeStartPauseButtonImage(forStateIsStarted: isStarted)
    }
}

//
//  TimerPresenter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

struct TimerData {
    let isWorkTime: Bool
    let isStarted: Bool
    let isAnimationStarted: Bool
    let workTime: Int
    let restTime: Int
}

class TimerPresenter: TimerViewOutput {

    unowned let view: TimerViewInput
    var interactor: TimerInteractorInput!
    var router: TimerRouter!

    private var timer = Timer()
    private var counter = 0.0

    private var isWorkTime = false
    private var isStarted = false
    private var isAnimationStarted = false
    private var workTime = 0
    private var restTime = 0

    private lazy var workTimeInSeconds: Double = {
        Double(workTime * 60)
    }()

    private lazy var restTimeInSeconds: Double = {
        Double(restTime * 60)
    }()

    private lazy var timerLabelTextForWork: String = {
        String("\(workTime < 10 ? "0\(workTime):00" : "\(workTime):00")")
    }()

    private lazy var timerLabelTextForRest: String = {
        String("\(restTime < 10 ? "0\(restTime):00" : "\(restTime):00")")
    }()

    required init(view: TimerViewInput) {
        self.view = view
    }

    func getDataForInitializeTimer() {
        interactor.provideInitializeTimerData()
    }

    func startPauseButtonTapped() {
        interactor.provideTimerDataForCountDown()
    }

    func settingsButtonTapped() {
        router.openSettingsViewConroller()
    }

}

//MARK: - TimerInteractorOutput -
extension TimerPresenter: TimerInteractorOutput {

    func receiveInitializeTimerData(with timerData: TimerData) {
        interactor.provideData()
        
        view.displayTimerLabel(with: isWorkTime ? timerLabelTextForWork : timerLabelTextForRest, forModeIswork: isWorkTime)
        view.displayStartPauseButton(forModeIswork: isWorkTime, andStateIsStarted: isStarted)
        view.displayCircularProgressBar(forModeIswork: isWorkTime)
    }

    func receiveTimerDataForCountDown(with timerData: TimerData) {
        interactor.provideData()

        view.displayStartPauseButton(forModeIswork: isWorkTime, andStateIsStarted: !isStarted)

        if !isAnimationStarted {
            interactor.toggleIsAnimationStarted()
        }

        view.changeCircularProgressBarAnimation(isAnimationStarted: isAnimationStarted,
                                                isWorkTime: isWorkTime,
                                                workTime: workTimeInSeconds,
                                                restTime: restTimeInSeconds)

        interactor.toggleIsStarted()
        timer.invalidate()

        guard isStarted else {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(startTimer),
                                         userInfo: nil,
                                         repeats: true)
            return
        }
    }

    func updateInternalData(with timerData: TimerData) {
        isWorkTime = timerData.isWorkTime
        isStarted = timerData.isStarted
        isAnimationStarted = timerData.isAnimationStarted
        workTime = timerData.workTime
        restTime = timerData.restTime
    }
}

//MARK: - TimerCountdown -
extension TimerPresenter {
    @objc func startTimer() {
        isWorkTime ? makeCountDown(of: workTimeInSeconds) : makeCountDown(of: restTimeInSeconds)
    }

    private func makeCountDown(of time: Double) {

        counter += 0.01

        let differenceTime = Int((time - counter).rounded(.up))
        let minutes = differenceTime / 60
        let seconds = differenceTime % 60

        let labelText = String("\(minutes < 10 ? "0\(minutes)" : "\(minutes)"):\(seconds < 10 ? "0\(seconds)" : "\(seconds)")")

        view.displayTimerLabel(with: labelText, forModeIswork: isWorkTime)

        if counter >= time  {
            timer.invalidate()
            changeTimerMode()
        }
    }

    private func changeTimerMode() {
        counter = 0

        interactor.toggleIsStarted()
        interactor.toggleIsWorkTime()
        interactor.toggleIsAnimationStarted()

        interactor.provideData()

        view.displayTimerLabel(with: isWorkTime ? timerLabelTextForWork : timerLabelTextForRest, forModeIswork: isWorkTime)
        view.displayStartPauseButton(forModeIswork: isWorkTime, andStateIsStarted: isStarted)
        view.displayCircularProgressBar(forModeIswork: isWorkTime)
    }
}

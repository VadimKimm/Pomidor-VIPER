//
//  TimerViewController.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

protocol TimerViewInput: AnyObject {
    func displayTimerLabel(with title: String, forModeIswork: Bool)
    func displayStartPauseButton(forModeIswork: Bool, andStateIsStarted: Bool)
    func displayCircularProgressBar(forModeIswork: Bool)
    func changeCircularProgressBarAnimation(isAnimationStarted: Bool, isWorkTime: Bool, workTime: Double, restTime: Double)
}

protocol TimerViewOutput: AnyObject {
    init(view: TimerViewInput)
    func getDataForInitializeTimer()
    func startPauseButtonTapped()
    func settingsButtonTapped()
}

class TimerViewController: UIViewController {

    var presenter: TimerViewOutput!

    private var timerView: TimerView? {
        guard isViewLoaded else { return nil }
        return view as? TimerView
    }

    //MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        view = TimerView()
        presenter.getDataForInitializeTimer()
        timerView?.startPauseButton.addTarget(self,
                                              action: #selector(startPauseButtonTapped),
                                              for: .touchUpInside)
        timerView?.settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)

    }

    // MARK: - @objc functions -

    @objc func startPauseButtonTapped(sender: UIButton) {
        presenter.startPauseButtonTapped()
    }

    @objc func settingsButtonTapped(sender: UIButton) {
        presenter.settingsButtonTapped()
    }
}

//MARK: - TimerViewInput -
extension TimerViewController: TimerViewInput {

    func displayTimerLabel(with title: String, forModeIswork: Bool) {
        timerView?.timerLabel.textColor = forModeIswork ? .red : .green
        timerView?.timerLabel.text = title
    }
    
    func displayStartPauseButton(forModeIswork: Bool, andStateIsStarted: Bool) {
        timerView?.startPauseButton.tintColor = forModeIswork ? .red : .green

        let imageConfig = TimerView.getButtonImageConfig()
        let image = UIImage(systemName: andStateIsStarted ? "pause" : "play",
                            withConfiguration: imageConfig)

        timerView?.startPauseButton.setImage(image, for: .normal)
    }

    func displayCircularProgressBar(forModeIswork: Bool) {
        if forModeIswork {
            timerView?.circularProgressBar.changeCircularPathColor(to: UIColor.red.cgColor)
        } else {
            timerView?.circularProgressBar.changeCircularPathColor(to: UIColor.green.cgColor)
        }
    }

    func changeCircularProgressBarAnimation(isAnimationStarted: Bool, isWorkTime: Bool, workTime: Double, restTime: Double) {
        if isAnimationStarted {
            timerView?.circularProgressBar.toggleAnimationState()
        } else {
            timerView?.circularProgressBar.startAnimation(duration: isWorkTime ? workTime : restTime)
        }
    }
}

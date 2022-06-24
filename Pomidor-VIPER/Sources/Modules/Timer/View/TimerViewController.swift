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
    func resetCircularProgressBarAnimation()
}

protocol TimerViewOutput: AnyObject {
    init(view: TimerViewInput)
    func getDataForInitializeTimer()
    func startPauseButtonTapped()
    func settingsButtonTapped()
    func resetButtonTapped()
}

class TimerViewController: UIViewController, FunctionDelegateProtocol  {
    func sendShort() {
        timerView!.timerLabel.text = "25:00"
    }
    
    func sendLong() {
        timerView!.timerLabel.text = "50:00"
    }

    var presenter: TimerViewOutput!

    private var timerView: TimerView? {
        guard isViewLoaded else { return nil }
        return view as? TimerView
    }

    //MARK: - Lifecycle -
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = TimerView()
        presenter.getDataForInitializeTimer()
        timerView?.startPauseButton.addTarget(self,
                                              action: #selector(startPauseButtonTapped),
                                              for: .touchUpInside)
        timerView?.settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        timerView?.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)

    }

    // MARK: - @objc functions -

    @objc func startPauseButtonTapped(sender: UIButton) {
        presenter.startPauseButtonTapped()
    }

    @objc func settingsButtonTapped(sender: UIButton) {
        presenter.settingsButtonTapped()
    }

    @objc func resetButtonTapped(sender: UIButton) {
        presenter.resetButtonTapped()
    }
}

//MARK: - TimerViewInput -
extension TimerViewController: TimerViewInput {

    func displayTimerLabel(with title: String, forModeIswork: Bool) {
        timerView?.timerLabel.textColor = forModeIswork ? UIColor.systemRed.withAlphaComponent(0.7) : UIColor.systemGreen.withAlphaComponent(0.7)
        timerView?.timerLabel.text = title
    }
    
    func displayStartPauseButton(forModeIswork: Bool, andStateIsStarted: Bool) {
        timerView?.startPauseButton.tintColor = forModeIswork ? .systemRed.withAlphaComponent(0.7) : .systemGreen.withAlphaComponent(0.7)

        let imageConfig = TimerView.getButtonImageConfig()
        let image = UIImage(systemName: andStateIsStarted ? "pause" : "play",
                            withConfiguration: imageConfig)

        timerView?.startPauseButton.setImage(image, for: .normal)
    }

    func displayCircularProgressBar(forModeIswork: Bool) {
        if forModeIswork {
            timerView?.circularProgressBar.changeCircularPathColor(to: UIColor.systemRed.withAlphaComponent(0.7).cgColor)
        } else {
            timerView?.circularProgressBar.changeCircularPathColor(to: UIColor.systemGreen.withAlphaComponent(0.7).cgColor)
        }
    }

    func changeCircularProgressBarAnimation(isAnimationStarted: Bool, isWorkTime: Bool, workTime: Double, restTime: Double) {
        if isAnimationStarted {
            timerView?.circularProgressBar.toggleAnimationState()
        } else {
            timerView?.circularProgressBar.startAnimation(duration: isWorkTime ? workTime : restTime)
        }
    }

    func resetCircularProgressBarAnimation() {
        timerView?.circularProgressBar.stopProgressBarAnimation()
    }
}

//
//  TimerViewController.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

protocol TimerViewInput: AnyObject {
    func displayTimerLabel(with title: String)
    func dislpayStartPauseButton(forModeIswork: Bool)
}

protocol TimerViewOutput: AnyObject {
    init(view: TimerViewInput)
    func showDetails()
    func startPauseButtonTapped()
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
        timerView?.startPauseButton.addTarget(self,
                                              action: #selector(startPauseButtonTapped),
                                              for: .touchUpInside)
        presenter.showDetails()
    }

    // MARK: - @objc functions -

    @objc func startPauseButtonTapped(sender: UIButton) {
        presenter.startPauseButtonTapped()
    }
}

//MARK: - TimerViewInput -
extension TimerViewController: TimerViewInput {

    func displayTimerLabel(with title: String) {
        timerView?.timerLabel.text = title
    }

    func dislpayStartPauseButton(forModeIswork: Bool) {
        timerView?.startPauseButton.tintColor = forModeIswork ? .red : .green
    }

}

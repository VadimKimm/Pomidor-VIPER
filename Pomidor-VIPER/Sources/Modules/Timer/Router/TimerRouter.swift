//
//  TimerRouter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

protocol TimerRouterInput {
    init(viewController: TimerViewController)
    func openSettingsViewConroller()
    static func openTimerViewController() -> UIViewController
}

class TimerRouter: TimerRouterInput {
    unowned let viewController: TimerViewController

    required init(viewController: TimerViewController) {
        self.viewController = viewController
    }

    func openSettingsViewConroller() {
        viewController.present(SettingsRouter.openSettingsViewController(), animated: true)
    }

    static func openTimerViewController() -> UIViewController {
        return TimerViewController()
    }
}

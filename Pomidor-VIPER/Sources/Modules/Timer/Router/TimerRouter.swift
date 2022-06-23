//
//  TimerRouter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

protocol TimerRouterInput: AnyObject {
    init(viewController: TimerViewController)
    func openSettingsViewController()
}

protocol SettingsModuleOutput: AnyObject {
    func receiveDataFromSettingsRouter(workTime: Int, restTime: Int)
}

class TimerRouter: TimerRouterInput {

    unowned let viewController: TimerViewController

    required init(viewController: TimerViewController) {
        self.viewController = viewController
    }

    func openSettingsViewController() {
        viewController.present(SettingsRouter.openSettingsViewController(), animated: true)
    }
}

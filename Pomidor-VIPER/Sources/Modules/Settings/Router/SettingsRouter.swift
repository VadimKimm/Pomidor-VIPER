//
//  SettingsRouter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

import UIKit

protocol SettingsRouterInput {
    init(viewController: SettingsViewController)
    func openTimerViewControllerAndSendData(workTime: Int, restTime: Int)
    static func openSettingsViewController() -> UIViewController
}

protocol SettingsRouterToTimerRouterOutput {
    static func receiveDataFromSettingsRouter(workTime: Int, restTime: Int)
}

class SettingsRouter: SettingsRouterInput {

    unowned let viewController: SettingsViewController

    required init(viewController: SettingsViewController) {
        self.viewController = viewController
    }

    func openTimerViewControllerAndSendData(workTime: Int, restTime: Int) {
        TimerRouter.receiveDataFromSettingsRouter(workTime: workTime, restTime: restTime)
        viewController.dismiss(animated: true)
    }

   static func openSettingsViewController() -> UIViewController {
        return SettingsViewController()
    }
}

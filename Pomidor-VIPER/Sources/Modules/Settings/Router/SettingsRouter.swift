//
//  SettingsRouter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

import UIKit

protocol SettingsRouterInput: AnyObject {
    init(viewController: SettingsViewController)
    func openTimerViewControllerAndSendData(workTime: Int, restTime: Int)
    static func openSettingsViewController() -> UIViewController
}

class SettingsRouter: SettingsRouterInput {

    unowned let viewController: SettingsViewController

    var timerRouter: SettingsRouterToTimerRouterOutput!

    required init(viewController: SettingsViewController) {
        self.viewController = viewController
    }

    func openTimerViewControllerAndSendData(workTime: Int, restTime: Int) {
//        timerRouter.receiveDataFromSettingsRouter(workTime: workTime, restTime: restTime)
        viewController.dismiss(animated: true)
    }

   static func openSettingsViewController() -> UIViewController {
        return SettingsViewController()
    }
}

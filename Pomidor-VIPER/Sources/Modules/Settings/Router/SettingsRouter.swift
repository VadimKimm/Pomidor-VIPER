//
//  SettingsRouter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

import UIKit

protocol SettingsRouterInput: AnyObject {
    init(viewController: SettingsViewController)
    func openTimerViewController()
    static func openSettingsViewController() -> UIViewController
}

class SettingsRouter: SettingsRouterInput {

    unowned let viewController: SettingsViewController

    var timerRouter: TimerRouter!
    
    required init(viewController: SettingsViewController) {
        self.viewController = viewController
    }

    func openTimerViewController() {
        viewController.dismiss(animated: true)
        
    }

   static func openSettingsViewController() -> UIViewController {
        return SettingsViewController()
    }
}

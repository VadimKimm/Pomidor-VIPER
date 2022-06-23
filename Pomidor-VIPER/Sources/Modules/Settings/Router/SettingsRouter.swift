//
//  SettingsRouter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

import UIKit

protocol SettingsRouterInput {
    init(viewController: SettingsViewController)
    func openTimerViewController()
    func openSettingsViewController() -> UIViewController
}

class SettingsRouter: SettingsRouterInput {
    unowned let viewController: SettingsViewController

    required init(viewController: SettingsViewController) {
        self.viewController = viewController
    }

    func openTimerViewController() {

    }

    func openSettingsViewController() -> UIViewController {
        return viewController
    }


}

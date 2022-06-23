//
//  TimerRouter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

protocol TimerRouterInput {
    init(viewController: TimerViewController)
    func openSettingsViewConroller()
}

class TimerRouter: TimerRouterInput {
    unowned let viewController: TimerViewController

    required init(viewController: TimerViewController) {
        self.viewController = viewController
    }
    

    func openSettingsViewConroller() {
        
    }
}

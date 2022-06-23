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
}

class TimerRouter: TimerRouterInput {
    unowned let viewController: TimerViewController

    required init(viewController: TimerViewController) {
        self.viewController = viewController
    }

    func openSettingsViewConroller() {
        viewController.present(SettingsRouter.openSettingsViewController(), animated: true)
    }
}

extension TimerRouter: SettingsRouterToTimerRouterOutput {
    static func receiveDataFromSettingsRouter(workTime: Int, restTime: Int) {
        print(workTime, restTime)
    }

}

//
//  TimerRouter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

protocol TimerRouterInput: AnyObject {
    init(viewController: TimerViewController, presenter: TimerRouterOutput)
    func openSettingsViewController()
}

protocol TimerRouterOutput: AnyObject {
    func getNewTimerSettings(workTime: Int, restTime: Int)
}

protocol SettingsRouterToTimerRouterOutput: AnyObject {
    func receiveDataFromSettingsRouter(workTime: Int, restTime: Int)
}

class TimerRouter: TimerRouterInput {

    unowned let viewController: TimerViewController
    unowned let presenter: TimerRouterOutput

    required init(viewController: TimerViewController, presenter: TimerRouterOutput) {
        self.viewController = viewController
        self.presenter = presenter
    }

    func openSettingsViewController() {
        viewController.present(SettingsRouter.openSettingsViewController(), animated: true)
    }
}

//MARK: - SettingsRouterToTimerRouterOutput -
extension TimerRouter {
    func receiveDataFromSettingsRouter(workTime: Int, restTime: Int) {
        presenter.getNewTimerSettings(workTime: workTime, restTime: restTime)
    }

}

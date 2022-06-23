//
//  AssemplyTimer.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation
import UIKit

protocol AssemblyTimerInput {
    static func assembleModule() -> UIViewController
}

class AssemblyTimer: AssemblyTimerInput {

    static func assembleModule() -> UIViewController {
        let viewContoller = TimerViewController()
        let presenter = TimerPresenter(view: viewContoller)
        let interactor = TimerInteractor(presenter: presenter)
        let router = TimerRouter(viewController: viewContoller, presenter: presenter)

        viewContoller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

//        router.presenter = presenter

        return viewContoller
    }
}

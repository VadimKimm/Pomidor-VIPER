//
//  AssemplyTimer.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

class AssemblyTimer{

    static func assembleModule() -> UIViewController {
        let viewContoller = TimerViewController()
        let presenter = TimerPresenter(view: viewContoller)
        let interactor = TimerInteractor(presenter: presenter)
        let router = TimerRouter(viewController: viewContoller)

        viewContoller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewContoller
    }
}

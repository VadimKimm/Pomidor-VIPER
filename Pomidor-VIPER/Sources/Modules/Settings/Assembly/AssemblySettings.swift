//
//  AssemblySettings.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 22.06.22.
//

import UIKit

protocol AssemblySettingsInputs {
    func assemblyModule(with view: SettingsViewController)
}

class AssemblySettings: AssemblySettingsInputs {

    func assemblyModule(with view: SettingsViewController) {
        let presenter = SettingsPresenter(view: view)
        let interactor = SettingsInteractor(presenter: presenter)
        let router = SettingsRouter(viewController: view)

        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

//
//  SettingsPresenter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

class SettingsPresenter: SettingsViewOutputProtocol {
//    MARK: - Properties
    unowned var view: SettingsViewInputProtocol
    var interactor: SettingsInteractorInputProtocol!
    var router: SettingsRouter!
    
//    MARK: - Initilizer
    required init(view: SettingsViewInputProtocol) {
        self.view = view
    }
//    MARK: - Functions
    func didTapSaveNewDurationButton() {
        router.openTimerViewController()
    }

    func tapChoseShortDuration() {
        interactor.choseDurationMode(.short)
    }

    func tapChoseLongDuration() {
        interactor.choseDurationMode(.long)
    }
}
// MARK: - Extension
extension SettingsPresenter: SettingsInteractorOutputProtocol {
    func receiveDurationData(durationData: Bool) {
        let mode = durationData ? "25 минут : 5 минут" : "50 минут : 10 минут"
        let durationModeString = "Выбран режим \(mode)"

        view.changeDuration(durationModeString)
    }
}

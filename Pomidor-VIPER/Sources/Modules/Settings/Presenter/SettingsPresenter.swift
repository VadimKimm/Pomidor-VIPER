//
//  SettingsPresenter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

protocol FunctionDelegateProtocol {
    func sendShort()
    func sendLong()
}

class SettingsPresenter: SettingsViewOutputProtocol {
//    MARK: - Properties
    unowned var view: SettingsViewInputProtocol
    var interactor: SettingsInteractorInputProtocol!
    var router: SettingsRouter!
    
    var delegate: FunctionDelegateProtocol!
    
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
        delegate.sendShort()
    }

    func tapChoseLongDuration() {
        interactor.choseDurationMode(.long)
        delegate.sendLong()
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

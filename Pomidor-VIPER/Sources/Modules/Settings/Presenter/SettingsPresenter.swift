//
//  SettingsPresenter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

protocol FunctionDelegateProtocol {
    func sendShort()
    func sendLong()
    func sendDemo()
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
    
    func tapChoseDemoDuration() {
        interactor.choseDurationMode(.demo)
        delegate.sendDemo()
    }
}
// MARK: - Extension
extension SettingsPresenter: SettingsInteractorOutputProtocol {
    func receiveDurationData(durationData: DurationData) {
        var mode = String()
        
        switch durationData {
        case .short:
            mode = "25 минут : 5 минут"
        case .long:
            mode = "50 минут : 10 минут"
        case .demo:
            mode = "1 минута : 1 минута"
        }
        let durationModeString = "Выбран режим \(mode)"

        view.changeDuration(durationModeString)
    }
}

//
//  SettingsRouter.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

// MARK: - Protocols
protocol SettingsInteractorInputProtocol: AnyObject {
    init(presenter: SettingsInteractorOutputProtocol)
    func choseDurationMode(_ mode: DurationData)
}

protocol SettingsInteractorOutputProtocol: AnyObject {
    func receiveDurationData(durationData: Bool)
}

// MARK: - Class
class SettingsInteractor: SettingsInteractorInputProtocol {
//    MARK: - Properties
    unowned let presenter: SettingsInteractorOutputProtocol
    
//    MARK: - Initialize
    required init(presenter: SettingsInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
//    MARK: - Functions
    func choseDurationMode(_ mode: DurationData) {
        var newDurationData = Bool()
        
        switch mode {
        case .short:
            newDurationData = true
            
            TimerEntity.timer.workTime = DurationData.shortWorkTime
            TimerEntity.timer.restTime = DurationData.shortRestTime
        case .long:
            newDurationData = false
            
            TimerEntity.timer.workTime = DurationData.longWorkTime
            TimerEntity.timer.restTime = DurationData.longRestTime
        }
        
        presenter.receiveDurationData(durationData: newDurationData)
    }

}

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
    func receiveDurationData(durationData: DurationData)
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
        
        switch mode {
        case .short:
            
            TimerEntity.timer.workTime = DurationData.shortWorkTime
            TimerEntity.timer.restTime = DurationData.shortRestTime
        case .long:
            
            TimerEntity.timer.workTime = DurationData.longWorkTime
            TimerEntity.timer.restTime = DurationData.longRestTime
        case .demo:
            
            TimerEntity.timer.workTime = DurationData.demoWorkTime
            TimerEntity.timer.restTime = DurationData.demoRestTime
        }
        
        presenter.receiveDurationData(durationData: mode)
    }

}

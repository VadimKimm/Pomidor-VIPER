//
//  SettingsEntity.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

enum DurationData {
    case short
    case long
    case demo
    
    static let shortWorkTime = 25
    static let shortRestTime = 5
    
    static let longWorkTime = 50
    static let longRestTime = 10
    
    static let demoWorkTime = 1
    static let demoRestTime = 1
}

struct Durations {
    var workDuration: Int
    var restDuration: Int
}

var savedDurations = Durations.init(workDuration: 25, restDuration: 5)

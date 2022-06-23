//
//  SettingsEntity.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

enum DurationData {
    case short
    case long
    
    static let shortWorkTime = 1500
    static let shortRestTime = 300
    
    static let longWorkTime = 3000
    static let longRestTime = 600
}

struct Durations {
    var workDuration: Int
    var restDuration: Int
}

var savedDurations = Durations.init(workDuration: 1500, restDuration: 300)

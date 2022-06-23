//
//  TimerEntity.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import Foundation

protocol TimerModel {
    var isWorkTime: Bool { get set }
    var isStarted: Bool { get set }
    var isAnimationStarted: Bool { get set}
    var workTime: Int { get set }
    var restTime: Int { get set }
}

class TimerEntity: TimerModel {
    var isWorkTime = true
    var isStarted = false
    var isAnimationStarted = false
    var workTime = 2
    var restTime = 1

    static var timer = TimerEntity()
}

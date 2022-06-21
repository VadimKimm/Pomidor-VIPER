//
//  RootRouter.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

class RootRouter {
    func presentViewContoller(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = AssemplyTimer.AssembleModule()
    }
}

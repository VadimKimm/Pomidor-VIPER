//
//  SceneDelegate.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 20.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        RootRouter().presentViewContoller(in: window)
        self.window = window
    }
}


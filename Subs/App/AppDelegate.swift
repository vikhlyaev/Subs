//
//  AppDelegate.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let screenBuilder: ScreenBuilder = ScreenBuilderImpl()
        let tabBarController = TabBarController(screenBuilder: screenBuilder)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

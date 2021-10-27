//
//  AppDelegate.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.isFirstLaunch() {
            let subID = UUID().uuidString
            UserDefaults.standard.setValue(subID, forKey: "subID")
            UserDefaults.standard.synchronize()
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: SearchViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

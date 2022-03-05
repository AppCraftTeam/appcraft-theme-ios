//
//  AppDelegate.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupTheme()
        
        self.window = .init()
        self.window?.rootViewController = TabBarController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func setupTheme() {
        AppThemeManager.shared.registerThemes([.light, .dark, .red, .gray])

        if AppThemeManager.shared.theme == nil {
            AppThemeManager.shared.theme = .light
        }
    }

}


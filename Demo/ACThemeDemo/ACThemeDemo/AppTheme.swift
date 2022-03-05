//
//  AppTheme.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import ACTheme
import UIKit

public enum AppTheme: String {
    case light = "light"
    case dark = "dark"
    case red = "red"
    case gray = "gray"
}

// MARK: - ACThemeProtocol
extension AppTheme: ACThemeProtocol {
    public typealias ThemeSettings = Settings
    
    public struct Settings: ACThemeSettingsProtocol {
        let bgColor: UIColor
        let textColor: UIColor
        let cardColor: UIColor
        let tintColor: UIColor
        let barStyle: UIBarStyle
    }
    
    public var settings: Settings {
        switch self {
        case .light:
            return Settings(
                bgColor: .white,
                textColor: .black,
                cardColor: .lightGray,
                tintColor: .blue,
                barStyle: .default
            )
        case .dark:
            return Settings(
                bgColor: .black,
                textColor: .white,
                cardColor: .gray,
                tintColor: .white,
                barStyle: .black
            )
        case .red:
            return Settings(
                bgColor: .white,
                textColor: .red,
                cardColor: UIColor.red.withAlphaComponent(0.5),
                tintColor: .red,
                barStyle: .default
            )
        case .gray:
            return Settings(
                bgColor: .lightGray,
                textColor: .white,
                cardColor: .gray,
                tintColor: .black,
                barStyle: .default
            )
        }
    }
}

// MARK: - Manager
class AppThemeManager: ACThemeManager<AppTheme> {
    static var shared = AppThemeManager()
}

// MARK: - NSObject + AppTheme
extension NSObject: ACThemableManageable {
    public typealias Theme = AppTheme
    
    public var themeManager: ACThemeManager<AppTheme> {
        AppThemeManager.shared
    }
}

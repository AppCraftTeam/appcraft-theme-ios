//
//  ACThemableManageable.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

public protocol ACThemableManageable: ACThemable {
    associatedtype Theme: ACThemeProtocol
    typealias ThemeSettings = Theme.ThemeSettings
    
    var themeManager: ACThemeManager<Theme> { get }
}

public extension ACThemableManageable {
    
    var didTheme: ACThemeSettingsClosure? {
        get { objc_getAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque()) as? ACThemeSettingsClosure }
        set { objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    @discardableResult
    func applyTheme(_ didTheme: @escaping ACThemeSettingsSpecificClosure<Self>) -> Self {
        self.didTheme = { object, settings in
            guard let object = object as? Self, let settings = settings as? ThemeSettings else { return }
            didTheme(object, settings)
        }
        
        self.themeManager.addWrapper(ACThemeWrapper(object: self))
        
        return self
    }
    
}

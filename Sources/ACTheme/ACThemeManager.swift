//
//  ACThemeManager.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

open class ACThemeManager<Theme: ACThemeProtocol> {
    
    // MARK: - Init
    public init() {
        self.themeDidSet()
    }
    
    // MARK: - Props
    open private(set) var wrappers: [ACThemeWrapper] = []
    open private(set) var themesRegistered: [Theme] = []
    private let themeRawValueKey = "themeRawValueKey"
    
    private var themeRawValue: String? {
        get { UserDefaults.standard.string(forKey: self.themeRawValueKey) }
        set { UserDefaults.standard.set(newValue, forKey: self.themeRawValueKey) }
    }

    public var theme: Theme? {
        get { self.themesRegistered.first(where: { $0.rawValue == self.themeRawValue }) }
        set {
            guard self.themeRawValue != newValue?.rawValue else { return }
            self.themeRawValue = newValue?.rawValue
            self.themeDidSet()
        }
    }

    // MARK: - Methods
    private func themeDidSet() {
        self.wrappers.clearNilsObjects().applyTheme(self.theme?.settings)
    }
    
    open func addWrapper(_ wrapper: ACThemeWrapper) {
        self.wrappers.clearNilsObjects()
        self.wrappers += [wrapper]
        wrapper.applyTheme(self.theme?.settings)
    }
    
    open func registerThemes(_ themes: [Theme]) {
        self.themesRegistered = themes
    }
    
}

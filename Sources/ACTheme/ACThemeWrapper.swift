//
//  ACThemeWrapper.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

public struct ACThemeWrapper {
    
    // MARK: - Init
    public init(object: ACThemable) {
        self.object = object
    }
    
    // MARK: - Props
    public private(set) weak var object: ACThemable?
    
    // MARK: - Methods
    public func applyTheme(_ themeSettings: ACThemeSettingsProtocol?) {
        guard let object = self.object, let themeSettings = themeSettings else { return }
        object.didTheme?(object, themeSettings)
    }
}

// MARK: - Array + ACThemeWrapper
public extension Array where Element == ACThemeWrapper {
    
    @discardableResult
    mutating func clearNilsObjects() -> Self {
        self = self.filter({ $0.object != nil })
        
        return self
    }
    
    func applyTheme(_ themeSettings: ACThemeSettingsProtocol?) {
        self.forEach { wrapper in
            wrapper.applyTheme(themeSettings)
        }
    }
    
}

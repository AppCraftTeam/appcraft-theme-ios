//
//  ACThemeProtocol.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

public protocol ACThemeProtocol {
    associatedtype ThemeSettings: ACThemeSettingsProtocol
    
    var rawValue: String { get }
    var settings: ThemeSettings { get }

    init?(rawValue: String)
}

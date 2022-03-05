//
//  ACThemable.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

public protocol ACThemable: AnyObject {
    var didTheme: ACThemeSettingsClosure? { get }
}

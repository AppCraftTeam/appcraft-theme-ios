//
//  Typealiases.swift
//  
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation

public typealias ACThemeSettingsClosure = (ACThemable, ACThemeSettingsProtocol) -> Void
public typealias ACThemeSettingsSpecificClosure<Object: ACThemableManageable> = (Object, Object.ThemeSettings) -> Void

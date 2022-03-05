//
//  NavigationController.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.applyTheme { navigationBar, settings in
            navigationBar.tintColor = settings.tintColor
            navigationBar.barTintColor = settings.bgColor
            navigationBar.titleTextAttributes = [.foregroundColor : settings.tintColor]
            navigationBar.barStyle = settings.barStyle
        }
    }
    
}

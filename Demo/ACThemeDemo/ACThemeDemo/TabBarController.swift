//
//  TabBarController.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.applyTheme { tabBar, settings in
            tabBar.barTintColor = settings.bgColor
            tabBar.tintColor = settings.tintColor
        }
        
        let listVC = ListViewController()
        let listItem = UITabBarItem(title: "LIST", image: nil, tag: 0)
        let listNavigation = NavigationController(rootViewController: listVC)
        listNavigation.tabBarItem = listItem
        
        let themeVC = ThemeViewController()
        let themeItem = UITabBarItem(title: "THEME", image: nil, tag: 0)
        let themeNavigation = NavigationController(rootViewController: themeVC)
        themeNavigation.tabBarItem = themeItem
        
        self.viewControllers = [listNavigation, themeNavigation]
        
    }
    
}

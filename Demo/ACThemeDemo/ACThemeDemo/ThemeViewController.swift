//
//  ThemeViewController.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import UIKit

class ThemeViewController: UIViewController {
    
    // MARK: - Classes
    class ThemeButton: UIButton {
        
        var theme: AppTheme? {
            didSet { self.setTitle(self.theme?.rawValue, for: .normal) }
        }
        
    }
    
    // MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Theme"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyTheme { view, settings in
            view.backgroundColor = settings.bgColor
        }
        
        let buttons: [UIButton] = AppThemeManager.shared.themesRegistered.map { theme in
            let button = ThemeButton(type: .system)
            button.theme = theme
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.applyTheme { view, settings in
                view.tintColor = settings.tintColor
            }
            button.addTarget(self, action: #selector(self.didTap(_:)), for: .touchUpInside)
            return button
        }
        
        let arrangedSubviews: [UIView] = buttons + [.init()]
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc
    func didTap(_ sender: ThemeButton) {
        AppThemeManager.shared.theme = sender.theme
    }
    
}

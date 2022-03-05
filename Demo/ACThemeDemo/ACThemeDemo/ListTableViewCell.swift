//
//  ListTableViewCell.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import UIKit
import ACTheme

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Props
    lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.numberOfLines = 0
        result.applyTheme { view, settings in
            view.textColor = settings.textColor
        }
        
        return result
    }()
    
    lazy var cardView: UIView = {
        let result = UIView()
        result.layer.cornerRadius = 16
        result.applyTheme { view, settings in
            view.backgroundColor = settings.cardColor
        }
        
        return result
    }()
    
    // MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        return
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        return
    }
    
    func setupComponents() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.cardView.removeFromSuperview()
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.removeFromSuperview()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(self.cardView)
        self.cardView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.cardView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 16),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -16)
        ])
    }
    
}

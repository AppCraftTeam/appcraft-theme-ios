//
//  ListViewController.swift
//  ACThemeDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import Foundation
import UIKit
import ACTheme

class ListViewController: UIViewController {
    
    // MARK: - Props
    lazy var tableView: UITableView = {
        let result = UITableView()
        result.backgroundColor = .clear
        result.dataSource = self
        result.delegate = self
        result.separatorStyle = .none
        result.register(ListTableViewCell.self, forCellReuseIdentifier: "DemoTableViewCell")
        
        return result
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let title = "Number: \(self.navigationController?.viewControllers.count.description ?? "0")"
        self.navigationItem.title = title
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyTheme { view, settings in
            view.backgroundColor = settings.bgColor
        }
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Int.random(in: 10...1000)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as? ListTableViewCell else { return .init() }
        cell.titleLabel.text = "\(indexPath)\n\n\(UUID().uuidString)"
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

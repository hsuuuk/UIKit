//
//  ViewController.swift
//  NavigationBarCode
//
//  Created by 심현석 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {

    var longtitude: Double?
    var latitude: Double?

    private let tableView = UITableView()
    let DataSourece: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNaviBar()
    }
    
    private func setupNaviBar() {
        navigationItem.title = "Music"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemMint
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func plusButtonTapped() {
        let addVC = SelectLocationViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.rowHeight = 50
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSourece.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = DataSourece[indexPath.row]
        
        return cell
    }
}


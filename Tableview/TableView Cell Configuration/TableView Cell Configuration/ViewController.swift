//
//  ViewController.swift
//  Cell Configuration
//
//  Created by 심현석 on 2023/03/05.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "heart")
        content.imageProperties.tintColor = .red
        content.imageToTextPadding = 100
        //content.text = "Text"
        content.attributedText = NSAttributedString(string: "Text", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.systemBlue
        ])
        content.secondaryAttributedText = NSAttributedString(string: "secondaryText", attributes: [
            .font: UIFont.systemFont(ofSize: 10, weight: .light),
            .foregroundColor: UIColor.systemGreen
        ])
        content.textProperties.alignment = .center
        content.secondaryTextProperties.alignment = .justified
        cell.contentConfiguration = content
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.backgroundColor = .lightGray
        backgroundConfig.cornerRadius = 10
        backgroundConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        backgroundConfig.strokeColor = .systemPurple
        backgroundConfig.strokeWidth = 5
        cell.backgroundConfiguration = backgroundConfig
        
        return cell
    }
}

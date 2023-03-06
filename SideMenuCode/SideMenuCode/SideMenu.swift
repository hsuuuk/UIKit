//
//  SideMenu.swift
//  SideMenuCode
//
//  Created by 심현석 on 2022/11/05.
//

import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItems)
}

enum SideMenuItems: String, CaseIterable {
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
}

class MenuController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    private let menuItems: [SideMenuItems]
    
    init(with menuItems: [SideMenuItems]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SideMenuCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .systemGray4 //view.backgroundColor = .systemGray4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.contentView.backgroundColor = .systemGray4 //cell.backgroundColor = .systemGray4
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}

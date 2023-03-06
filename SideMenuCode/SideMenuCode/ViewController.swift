////
////  ViewController.swift
////  SideMenuCode
////
////  Created by 심현석 on 2022/11/04.
////
//

import UIKit
import SideMenu
import SwiftUI

class ViewController: UIViewController {
    
    private var sideMenu: SideMenuNavigationController!
    private let infoViewController = InfoViewController()
    private let settingsViewController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavibar()
        setupSideMenu()
        
        view.backgroundColor = .systemMint
    }
    
    func setupNavibar() {
        navigationItem.title = "Weather"
        
        let appearance = UINavigationBarAppearance()
        //appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftBarButtonTapped))
        leftBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func leftBarButtonTapped() {
        present(sideMenu, animated: true)
    }
    
    private func setupSideMenu() {
        let menu = MenuController(with: SideMenuItems.allCases) //allCase -> enum SideMenuItems: CaseIterable
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        
        menu.delegate = self
        
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(settingsViewController)
        addChild(infoViewController)
        
        view.addSubview(settingsViewController.view)
        view.addSubview(infoViewController.view)
        
        settingsViewController.view.frame = view.bounds
        infoViewController.view.frame = view.bounds
        
        settingsViewController.didMove(toParent: self)
        infoViewController.didMove(toParent: self)
        
        settingsViewController.view.isHidden = true
        infoViewController.view.isHidden = true
    }
}

extension ViewController: MenuControllerDelegate {
    
    func didSelectMenuItem(named: SideMenuItems) {
        sideMenu?.dismiss(animated: true)
        navigationItem.title = named.rawValue
        
        switch named {
        case .home:
            settingsViewController.view.isHidden = true
            infoViewController.view.isHidden = true
        case .info:
            settingsViewController.view.isHidden = true
            infoViewController.view.isHidden = false
        case .settings:
            settingsViewController.view.isHidden = false
            infoViewController.view.isHidden = true
        }
    }
}

struct PreView: PreviewProvider {
     static var previews: some View {
         ViewController().toPreview()
     }
 }



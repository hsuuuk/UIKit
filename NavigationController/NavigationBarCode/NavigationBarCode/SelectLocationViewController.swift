//
//  AddViewController.swift
//  NavigationBarCode
//
//  Created by 심현석 on 2022/11/08.
//

import UIKit

class SelectLocationViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private let firstSection = ["현재 위치"]
    private let secondSection = ["서울", "대전", "대구", "부산"]
    
    var filteredArr: [String] = []
    var filtering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "위치 설정"
        navigationController?.navigationBar.topItem?.title = ""
        
        setupSearchbar()
        setupTableView()
    }
    
    func setupSearchbar() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        searchController.searchBar.placeholder = "도시 이름"
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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

extension SelectLocationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if filtering == true {
            return filteredArr.count
        }
        else if filtering == false {
            if section == 0 {
                return firstSection.count
            } else if section == 1 {
                return secondSection.count
            } else {
                return 0
            }
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if filtering {
            if indexPath.section == 0 {
                cell.textLabel?.text = firstSection[indexPath.row]
            }
            if indexPath.section == 1 {
                cell.textLabel?.text = filteredArr[indexPath.row]
            }
        } else {
            if indexPath.section == 0 {
                cell.textLabel?.text = firstSection[indexPath.row]
            } else if indexPath.section == 1 {
                cell.textLabel?.text = secondSection[indexPath.row]
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
        
        sendmyData()
        sendCityData(cityName: secondSection[indexPath.row])
    }
    
    func sendmyData() {
        
    }
    
    func sendCityData(cityName: String) {
        let vc = ViewController()
        let locationData = LocationData()
        
        guard let longtitude = locationData.dataCollection["\(cityName)"]?[0] else { return }
        guard let latitude = locationData.dataCollection["\(cityName)"]?[1] else { return }
        
        vc.longtitude = longtitude
        vc.latitude = latitude
        
        print(vc.longtitude!)
        print(vc.latitude!)
    }
}

extension SelectLocationViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        filteredArr = secondSection.filter { $0.contains(text) }

        tableView.reloadData()
    }
}

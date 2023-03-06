//
//  ViewController.swift
//  TableviewCode
//
//  Created by 심현석 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {

    var tableview = UITableView()
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupTableViewConstraints()
    }
    
    func setupTableView() {
        
        // 델리게이트 패턴의 대리자 설정
        tableview.dataSource = self
        tableview.delegate = self
        // 재사용할 셀의 타입을 identifier를 기반으로 확인하겠다는 것을 테이블뷰에 알려주는 메서드
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    }
    
    func setupTableViewConstraints() {
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400)
        ])
    }
}

// 셀을 클릭한 후의 설정
extension ViewController: UITableViewDelegate {
    
}
// 셀에 데이터를 적용하고 테이블뷰에 넣어주는 역할
extension ViewController: UITableViewDataSource {
    
    // 1) 각 세션이 몇개의 행을 포함하는지 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    // 2) 셀의 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀을 재사용 안하는 코드(메모리관리 불가능)
        //let cell = UITableViewCell()
        // 셀을 재사용 하는 코드(메모리관리 가능)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
}

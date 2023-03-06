//
//  ViewController.swift
//  APITableViewLabel
//
//  Created by 심현석 on 2022/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var networkManager = NetworkManager()
    
    var dataArr: [BtsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        setupNetwork()
    }
    
    func setupTableview() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupNetwork() {
        // 네트워킹의 시작
        networkManager.fetch() { result in
            self.dataArr = result!
            // 테이블뷰 리로드
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// 셀을 클릭한 후의 설정
extension ViewController: UITableViewDelegate {
    
}
// 셀에 데이터를 적용하고 테이블뷰에 넣어주는 역할
extension ViewController: UITableViewDataSource {
    
    // 1) 각 세션이 몇개의 행을 포함하는지 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    // 2) 셀의 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀을 재사용 안하는 코드(메모리관리 불가능)
        //let cell = UITableViewCell()
        // 셀을 재사용 하는 코드(메모리관리 가능)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusedCell", for: indexPath) as! TableViewCell
        
        cell.imageUrl = dataArr[indexPath.item].albumimage
        
        return cell
    }
}



//
//  ViewController.swift
//  SendDataNotification
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

private let identifier = "cell"

class ViewController: UIViewController {

    var tableView = UITableView()
    
    var memoArr: [String] = ["1"] {
        didSet { tableView.reloadData() }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "메모"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: identifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func rightBarButtonTapped() {
        let controller = PlusController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.tintColor = .black
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
        cell.memoLabel.text = memoArr[indexPath.row]
        cell.index = indexPath.row
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: CustomCellDelegate {
    func didTapButton(cell: Cell, data: String) {
        let controller = EditController()
        navigationController?.pushViewController(controller, animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: ["data": data])
        print(data)
    }
}

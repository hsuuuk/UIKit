//
//  ViewController.swift
//  SendDataDelegate
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

private let identifier = "cell"

class ViewController: UIViewController {

    var tableView = UITableView()
    
    var memoArr: [String] = ["1"] {
        didSet {
            print("reloadData: \(memoArr)")
            tableView.reloadData()
        }
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
        tableView.register(CustomCell.self, forCellReuseIdentifier: identifier)
        
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
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.tintColor = .black
        print("send delegate: \(memoArr)")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomCell
        cell.delegate = self
        cell.memoLabel.text = memoArr[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: CellDelegate {
    func cell(_ cell: CustomCell, didEdit text: String) {
        let controller = EditController()
        controller.editMemoTextView.text = text
        controller.delegate = self
        
//        guard let indexPath = tableView.indexPath(for: cell) else { return }
//        memoArr[indexPath.row] = controller.editMemoTextView.text
        
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ViewController: PlusControllerDelegate {
    func data(_ data: String) {
        memoArr.append(data)
        print("recieve delegate: \(memoArr)")
    }
}

extension ViewController: EditControllerDelegate {
    func didUpdateMemo(with text: String) {
        <#code#>
    }
}

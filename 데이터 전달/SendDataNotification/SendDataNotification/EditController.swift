//
//  EditController.swift
//  SendDataNotification
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

class EditController: UIViewController {
    
    //var editMemo: String?
    
    private let editMemoTextView: UILabel = {
        let tv = UILabel()
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.text = "꺼져"
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }
    
    @objc func handleNotification(notification: Notification) {
        if let userInfo = notification.userInfo, let data = userInfo["data"] as? String {
            editMemoTextView.text = data
        }
    }

    func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .black
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
        
        view.addSubview(editMemoTextView)
        editMemoTextView.translatesAutoresizingMaskIntoConstraints = false
        editMemoTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        editMemoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        editMemoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        editMemoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func rightBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

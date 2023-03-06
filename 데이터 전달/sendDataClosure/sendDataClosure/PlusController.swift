//
//  PlusController.swift
//  SendDataNotification
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

class PlusController: UIViewController {
    
    var plusCompletionButtonAction: ((String) -> Void)?
    
    private let plusMemoTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .black
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completionButton))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
        
        view.addSubview(plusMemoTextView)
        plusMemoTextView.translatesAutoresizingMaskIntoConstraints = false
        plusMemoTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        plusMemoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        plusMemoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        plusMemoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func completionButton() {
        if plusMemoTextView.text != "" {
            guard let text = plusMemoTextView.text else { return }
            plusCompletionButtonAction?(text)
            print("send data: \(text)")
            
            print("go popViewController")
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

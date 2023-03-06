//
//  SecondViewController.swift
//  SendDataDelegate
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

protocol PlusControllerDelegate {
    func data(_ data: String) -> Void
}

class PlusController: UIViewController {
        
    var delegate: PlusControllerDelegate?
    
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
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
                
        view.addSubview(plusMemoTextView)
        plusMemoTextView.translatesAutoresizingMaskIntoConstraints = false
        plusMemoTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        plusMemoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        plusMemoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        plusMemoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func rightBarButtonTapped() {
        guard let text = plusMemoTextView.text else { return }
        delegate?.data(text)
        navigationController?.popViewController(animated: true)
    }
}


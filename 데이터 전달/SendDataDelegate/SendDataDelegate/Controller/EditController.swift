//
//  EditController.swift
//  SendDataDelegate
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

protocol EditControllerDelegate {
    func didUpdateMemo(with text: String)
}

class EditController: UIViewController {
    
    var delegate: EditControllerDelegate?
    
    var editMemoTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.text = "바보"
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
        
        view.addSubview(editMemoTextView)
        editMemoTextView.translatesAutoresizingMaskIntoConstraints = false
        editMemoTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        editMemoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        editMemoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        editMemoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func rightBarButtonTapped() {
        guard let text = editMemoTextView.text else { return }
        delegate?.didUpdateMemo(with: text)
        navigationController?.popViewController(animated: true)
    }
}

//
//  SecondViewController.swift
//  firstNoti
//
//  Created by 심현석 on 2022/10/28.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dataSenderButton(_ sender: UIButton) {
        
        if let text = textField.text {
            NotificationCenter.default.post(name: Notification.Name("fistNoti"), object: text)
        }
        
        dismiss(animated: true)
    }
}

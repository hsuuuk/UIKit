//
//  ViewController.swift
//  FirstNoti2
//
//  Created by 심현석 on 2022/10/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
//        NotificationCenter.default.addObserver(self, selector: #selector(getnoti), name: NSNotification.Name("a"), object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name("a"), object: nil, queue: OperationQueue.main) { notification in
            guard let text = notification.userInfo?["b"] as? String else { return }
            self.label.text = text
        }

        guard let text = textField.text else { return }
        NotificationCenter.default.post(name: NSNotification.Name("a"), object: nil, userInfo: ["b" : text])
        
        
        NotificationCenter.default.removeObserver(self)
    }
    
//    @objc func getnoti(notification: Notification) {
//        guard let text = notification.userInfo?["b"] as? String else { return }
//        label.text = text
//    }
    
    
}

//
//  ViewController.swift
//  firstNoti
//
//  Created by 심현석 on 2022/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData(_ :)), name: Notification.Name("fistNoti"), object: nil)
    }
    
    @objc func getData(_ notification: Notification) {
        
        if let text = notification.object as? String {
            dataLabel.text = text
        }
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
}


//
//  ViewController.swift
//  firstAPI
//
//  Created by 심현석 on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    var dataManager = DataManager()
    var dataArr = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNetwork()
    }
    
    func setupNetwork() {
        
        dataManager.fetchData() { result in
            self.dataArr = result!
            
            DispatchQueue.main.sync {
                self.label.text = self.dataArr[0].albumName
                self.loadImage()
            }
        }
    }
    
    func loadImage() {
        guard let url = URL(string: dataArr[0].albumImage!) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }

            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
        }
    }
}

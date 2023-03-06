//
//  ViewController.swift
//  firstAPI2
//
//  Created by 심현석 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    var infoArr = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNetwork()
    }
    
    func setupNetwork() {
        
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=blackpink") else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            guard let newData = try? decoder.decode(JSONData.self, from: data) else { return }
            self.infoArr = newData.results
            DispatchQueue.main.async {
                self.label.text = self.infoArr[0].albumName
                self.loadImage()
            }
        } .resume()
    }
    
    func loadImage() {
        guard let url = URL(string: infoArr[0].albumImage!) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }

            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
        }
    }
}


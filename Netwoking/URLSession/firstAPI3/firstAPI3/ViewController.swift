//
//  ViewController.swift
//  firstAPI3
//
//  Created by 심현석 on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    var musciArr = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func searchButton(_ sender: UIButton) {
        if let artistName = artistNameTextField.text {
            setupNetworking(artistName: artistName)
        }
    }
    
    func setupNetworking(artistName: String) {
        var components = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "music")
        let termQuery = URLQueryItem(name: "term", value: "\(artistName)")
        components.queryItems = [mediaQuery, termQuery]
        
        let requestURL = components.url!
        let session = URLSession(configuration: .default)
        session.dataTask(with: requestURL) { data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, error == nil else { return }
            
            let decoder = JSONDecoder()
            guard let newData = try? decoder.decode(DecodedData.self, from: data) else { return }
            self.musciArr = newData.results
            
            DispatchQueue.main.async {
                self.label.text = self.musciArr.first?.albumName
                self.loadImage()
            }
        } .resume()
    }
    
    func loadImage() {
        guard let imageURL = musciArr.first?.albumImage, let url = URL(string: imageURL) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
        }
    }
}

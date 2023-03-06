//
//  CollectionViewCell.swift
//  firstAlamofire
//
//  Created by 심현석 on 2022/10/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️
            guard self.imageUrl! == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
        }
    }
}

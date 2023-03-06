//
//  CollectionViewCell.swift
//  CollectionviewCode
//
//  Created by 심현석 on 2022/10/06.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpCell()
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell() {
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setUpLabel() {
        
        label.textAlignment = .center
    }
}


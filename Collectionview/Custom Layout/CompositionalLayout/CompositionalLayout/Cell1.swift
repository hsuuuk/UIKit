//
//  Cell.swift
//  CustomLayout
//
//  Created by 심현석 on 2023/03/01.
//

import UIKit

class FirstCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

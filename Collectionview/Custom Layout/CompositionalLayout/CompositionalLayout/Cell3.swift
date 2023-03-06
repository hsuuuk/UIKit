//
//  ThirdCell.swift
//  CustomLayout
//
//  Created by 심현석 on 2023/03/01.
//

import UIKit

class ThirdCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

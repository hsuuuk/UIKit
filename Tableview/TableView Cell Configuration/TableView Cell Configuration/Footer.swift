//
//  Footer.swift
//  TableView Cell Configuration
//
//  Created by 심현석 on 2023/03/05.
//

import UIKit

class Footer: UICollectionReusableView {

    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "제목"
        lb.font = UIFont.boldSystemFont(ofSize: 17)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

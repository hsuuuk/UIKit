//
//  TableViewCell.swift
//  TableViewNib
//
//  Created by 심현석 on 2022/11/11.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with para: MainClass) {
        label.text = "최고온도: \(para.tempMax)도"
    }
}

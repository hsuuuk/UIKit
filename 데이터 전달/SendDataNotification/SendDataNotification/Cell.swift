//
//  Cell.swift
//  SendDataNotification
//
//  Created by 심현석 on 2023/01/30.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapButton(cell: Cell, data: String)
}

class Cell: UITableViewCell {

    weak var delegate: CustomCellDelegate?
    var index = 0
    
    var outlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        view.layer.cornerRadius = 7
        
        return view
    }()
    
    var memoLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        return lb
    }()
    
    var inlineView: UIView = {
        let view = UIView()
        return view
    }()
    
    var editButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("수정", for: .normal)
        bt.backgroundColor = .white
        bt.layer.cornerRadius = 3
        bt.layer.borderColor = UIColor.lightGray.cgColor
        bt.layer.borderWidth = 0.5
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.black, for: .normal)
        bt.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func editButtonTapped() {
        guard let text = memoLabel.text else { return }
        delegate?.didTapButton(cell: self, data: text)
    }
    
    func setupUI() {
        contentView.addSubview(outlineView)
        outlineView.translatesAutoresizingMaskIntoConstraints = false
        outlineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        outlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        outlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        outlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        outlineView.addSubview(inlineView)
        inlineView.translatesAutoresizingMaskIntoConstraints = false
        inlineView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        inlineView.bottomAnchor.constraint(equalTo: outlineView.bottomAnchor).isActive = true
        inlineView.leadingAnchor.constraint(equalTo: outlineView.leadingAnchor).isActive = true
        inlineView.trailingAnchor.constraint(equalTo: outlineView.trailingAnchor).isActive = true
        
        inlineView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.bottomAnchor.constraint(equalTo: inlineView.bottomAnchor, constant: -5).isActive = true
        editButton.trailingAnchor.constraint(equalTo: inlineView.trailingAnchor, constant: -5).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        outlineView.addSubview(memoLabel)
        memoLabel.translatesAutoresizingMaskIntoConstraints = false
        memoLabel.topAnchor.constraint(equalTo: outlineView.topAnchor).isActive = true
        memoLabel.bottomAnchor.constraint(equalTo: inlineView.topAnchor).isActive = true
        memoLabel.leadingAnchor.constraint(equalTo: outlineView.leadingAnchor, constant: 10).isActive = true
        memoLabel.trailingAnchor.constraint(equalTo: outlineView.trailingAnchor).isActive = true
    }
}

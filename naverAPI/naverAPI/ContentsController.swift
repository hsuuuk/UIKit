//
//  ContentsController.swift
//  naverAPI
//
//  Created by 심현석 on 2023/02/14.
//

import UIKit
import SnapKit

class ContentsController: UIViewController {
    
    var labela: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labelb: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labelc: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labeld: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labelaa: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labelbb: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labelcc: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    var labeldd: UILabel = {
        let lb = UILabel()
        lb.text = "데이터"
        return lb
    }()
    
    lazy var nameStack: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [labela, labelb, labelc, labeld])
        stv.axis = .vertical
        stv.spacing = 10
        stv.distribution = .fillEqually
        //stv.backgroundColor = .lightGray
        return stv
    }()
    
    lazy var textStack: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [labelaa, labelbb, labelcc, labeldd])
        stv.axis = .vertical
        stv.spacing = 10
        stv.distribution = .fillEqually
        //stv.backgroundColor = .systemFill
        return stv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(nameStack)
        nameStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview().offset(-300)
            make.bottom.equalToSuperview().offset(-300)
        }
        
        view.addSubview(textStack)
        textStack.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(nameStack.snp.right)
            make.bottom.equalToSuperview().offset(-300)
        }
    }
}

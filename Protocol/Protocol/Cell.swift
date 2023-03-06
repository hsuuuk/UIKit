import UIKit

protocol CellDelegate: AnyObject {
    func sendEditData(_ cell: Cell, Data text: String)
    func didEdit(_ cell: Cell, didEdit text: String)
}

class Cell: UITableViewCell {

    weak var delegate: CellDelegate?

    var label: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.font = UIFont.sys
        lb.text = "123123"
        return lb
    }()
    
    private lazy var editButton: UIButton = {
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
        delegate?.sendEditData(self, Data: label.text ?? "")
    }
    
    func setupUI() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
//        contentView.addSubview(editButton)
//        editButton.translatesAutoresizingMaskIntoConstraints = false
//        editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//        editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
//        editButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

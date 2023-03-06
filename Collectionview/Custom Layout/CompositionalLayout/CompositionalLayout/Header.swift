import UIKit

class Header: UICollectionReusableView {

    let label: UILabel = {
        let lb = UILabel()
        lb.text = "카테고리"
        lb.font = UIFont.boldSystemFont(ofSize: 17)
        return lb
    }()
    let button: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("더보기", for: .normal)
        bt.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return bt
    }()
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .red

        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

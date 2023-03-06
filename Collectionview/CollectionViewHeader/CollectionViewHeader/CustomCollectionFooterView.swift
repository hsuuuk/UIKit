import UIKit

class CustomCollectionFooterView: UICollectionReusableView {
    static let identifier = "CustomCollectionFooterView"
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Footer".uppercased()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    
    func configure() {
        backgroundColor = .systemPink
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

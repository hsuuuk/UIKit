import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print(view.frame.width)
    }
    
    func configure() {
        let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.backgroundColor = .systemCyan
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellWidth: CGFloat
        var cellHeight: CGFloat = 175
        
        switch indexPath.item {
        case 0:
            cellWidth = view.frame.width - 30
            cellHeight = 150
        case 1:
            cellWidth = view.frame.width - 30
            cellHeight = 300
        default:
            cellWidth = (view.frame.width - 30 - 10) / 2
        }
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

//
//  ViewController.swift
//  CollectionviewXIB
//
//  Created by 심현석 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupCollectionViewConstraint()
        setupFlowLayout()
    }

    func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.dataSource = self
        // Nib파일 사용시 등록
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusedCell")
    }
    
    func setupCollectionViewConstraint() {
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    func setupFlowLayout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusedCell", for: indexPath) as! CollectionViewCell
        
        cell.label.text = arr[indexPath.row]
        
        return cell
    }
}

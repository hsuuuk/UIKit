//
//  ViewController.swift
//  CollectionviewCode
//
//  Created by 심현석 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupCollectionViewConstraint()
        //setupCollectionViewFlowLayout()
    }

    func setupCollectionView() {
        
        collectionview = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        collectionview.dataSource = self
        //customCollectionView.delegate = self
        
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "reusedCell")
    }
    
    func setupCollectionViewConstraint() {
        
        self.view.addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        collectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
    }
    
    func setupCollectionViewFlowLayout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        // 컬렉션뷰의 속성에 할당
        collectionview.collectionViewLayout = flowLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: 200)
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "reusedCell", for: indexPath) as! CollectionViewCell
        
        cell.label.text = arr[indexPath.row]
        cell.backgroundColor = .lightGray
        
        return cell
    }
}


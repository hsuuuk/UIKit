//
//  ViewController.swift
//  CustomLayout
//
//  Created by 심현석 on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let layout = CustomLayout.CompositionalLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        collectionView.register(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        collectionView.register(ThirdCell.self, forCellWithReuseIdentifier: "ThirdCell")
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCell", for: indexPath) as! ThirdCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! Header
        
        switch indexPath.section {
        case 0: header.label.text = "오늘의 노래"
        case 1: header.label.text = "내일의 노래"
        default: header.label.text = "어제의 노래"
        }
        
        return header
    }
}

extension ViewController: UICollectionViewDelegate {
}

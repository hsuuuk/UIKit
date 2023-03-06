//
//  ViewController.swift
//  Collectionview
//
//  Created by 심현석 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        collectionview.dataSource = self
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

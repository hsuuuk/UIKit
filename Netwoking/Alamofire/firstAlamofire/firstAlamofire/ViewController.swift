//
//  ViewController.swift
//  firstAlamofire
//
//  Created by 심현석 on 2022/10/12.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: [Music] = []
        
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchbar()
    }
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
        
        flowLayout.itemSize = CGSize(width: 125, height: 125)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
    }
    
    func setupSearchbar() {
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.autocapitalizationType = .none
        self.navigationItem.hidesSearchBarWhenScrolling = false

        searchController.searchBar.delegate = self
    }
    
    func setupNetworking(artistName: String) {
        
        let url = "https://itunes.apple.com/search"
        let parameters = ["media": "music", "term": "\(artistName)"]
        AF.request(url, parameters: parameters).validate().response { response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let newData = try? decoder.decode(DecodedData.self, from: response.data!) else { return }
                self.dataSource = newData.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure:
                return
            }
        } .resume()
    }
}

// 셀을 클릭한 후의 설정
extension ViewController: UICollectionViewDelegate {
    
}

// 셀에 데이터를 적용하고 테이블뷰에 넣어주는 역할
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusedCell", for: indexPath) as! CollectionViewCell
        
        cell.imageUrl = dataSource[indexPath.item].albumImage
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }
}

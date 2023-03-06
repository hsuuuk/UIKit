//
//  ViewController.swift
//  collectionViewSearchBarAPI
//
//  Created by 심현석 on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var musicArr: [Music] = []
    
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
        
        flowLayout.itemSize = CGSize(width: 103, height: 103)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    func setupSearchbar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        searchController.searchBar.placeholder = "Search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupNetworking(artistName: String) {
        var components = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "music")
        let termQuery = URLQueryItem(name: "term", value: "\(artistName)")
        components.queryItems = [mediaQuery, termQuery]
        
        let requestURL = components.url!
        let session = URLSession(configuration: .default)
        session.dataTask(with: requestURL) { data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, error == nil else { return }
            
            let decoder = JSONDecoder()
            guard let newData = try? decoder.decode(DecodedData.self, from: data) else { return }
            self.musicArr = newData.results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
        return musicArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusedCell", for: indexPath) as! CollectionViewCell
        
        cell.imageUrl = musicArr[indexPath.item].albumImage
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }
}

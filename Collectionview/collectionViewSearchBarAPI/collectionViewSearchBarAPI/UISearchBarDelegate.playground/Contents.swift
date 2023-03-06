import UIKit

//let searchController = UISearchController()
//self.navigationItem.searchController = searchController
//searchController.searchBar.delegate = self

// 🍏 (단순) 서치바 확장
extension ViewController: UISearchBarDelegate {

    // 🥕유저가 글자를 입력하는 순간마다 호출되는 메서드
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }

    // 🥕검색(Search) 버튼을 눌렀을때 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }
}

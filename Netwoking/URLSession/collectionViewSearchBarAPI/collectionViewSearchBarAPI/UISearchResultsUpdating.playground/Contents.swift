import UIKit

//let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "스토리보드ID") as! 뉴뷰컨)
//self.navigationItem.searchController = searchController
//searchController.searchResultsUpdater = self

// 🍎 검색하는 동안 새로운 화면(페이지)를 띄우는 등의 복잡한 기능을 구현하는 서치바 확장
extension ViewController: UISearchResultsUpdating {
    
    // 유저가 글자를 입력하는 순간마다 호출되는 메서드
    func updateSearchResults(for searchController: UISearchController) {
        
        // 뉴뷰컨에 데이터 전달
        let newViewController = searchController.searchResultsController as! 뉴뷰컨
        newViewController.artistName = searchController.searchBar.text ?? ""
    }
}

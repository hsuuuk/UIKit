import UIKit

//let searchController = UISearchController()
//self.navigationItem.searchController = searchController
//searchController.searchBar.delegate = self

// π (λ¨μ) μμΉλ° νμ₯
extension ViewController: UISearchBarDelegate {

    // π₯μ μ κ° κΈμλ₯Ό μλ ₯νλ μκ°λ§λ€ νΈμΆλλ λ©μλ
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }

    // π₯κ²μ(Search) λ²νΌμ λλ μλ νΈμΆλλ λ©μλ
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        setupNetworking(artistName: text)
    }
}

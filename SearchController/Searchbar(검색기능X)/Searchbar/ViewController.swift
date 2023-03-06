import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        setupSearchbar()
    }

    func setupTableview() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setupSearchbar() {
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search Dj"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["a", "b", "c", "d", "e", "f"]
        searchController.searchBar.showsScopeBar = true // scopbar 항상 출력할지 말지
        searchController.hidesNavigationBarDuringPresentation = false // 검색 중에 네비바 타이틀을 숨길지 말지
        searchController.automaticallyShowsCancelButton = true // 자동으로 Cancel버튼 나오게 할지 말지
        searchController.obscuresBackgroundDuringPresentation = true // 검색 중에 화면 어둡게 할지 말지
        self.navigationItem.hidesSearchBarWhenScrolling = false // 스크롤 할때 서치바 숨길지 말지
        
    }
}

extension ViewController: UITableViewDelegate {
    
}
                            
extension ViewController: UITableViewDataSource {
    
    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드(애플이 미리 잘 만들어 놓음)
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
        let cell = UITableViewCell()
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    
}

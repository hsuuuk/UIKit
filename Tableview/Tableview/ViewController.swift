import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
    }

    func setupTableview() {
        
        tableview.delegate = self
        tableview.dataSource = self
    }

}

// 셀을 클릭한 후의 설정
extension ViewController: UITableViewDelegate {
    
}
// 셀에 데이터를 적용하고 테이블뷰에 넣어주는 역할
extension ViewController: UITableViewDataSource {
    
    // 1) 각 세션이 몇개의 행을 포함하는지 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    // 2) 셀의 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 🥕셀을 재사용하지 않는 코드(메모리관리 불가능)
        //let cell = UITableViewCell()
        // 🥕셀을 재사용 하는 코드(메모리관리 가능)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
}

import UIKit

class TableViewController: UITableViewController {
        
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 각 세션이 몇개의 행을 포함하는지 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    // 셀의 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀을 재사용 안하는 코드(메모리관리 불가능)
        //let cell = UITableViewCell()
        // 셀을 재사용 하는 코드(메모리관리 가능)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
}

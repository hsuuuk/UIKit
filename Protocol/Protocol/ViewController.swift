import UIKit

private let identifier = "cell"

class ViewController: UIViewController {

    var tableView = UITableView()
    
    var arr: [String] = ["1", "2"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: identifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
        cell.label.text = arr[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: CellDelegate {
    func sendEditData(_ cell: Cell, Data text: String) {
        let controller = EditController()
        controller.editMemoTextView.text = text
        controller.delegate = self

        navigationController?.pushViewController(controller, animated: true)
    }
    
    func didEdit(_ cell: Cell, didEdit text: String) {
        print(text)
        if let indexPath = tableView.indexPath(for: cell) {
            print(indexPath)
            print(indexPath.row)
            arr[indexPath.row] = text
        } else {
            print("error")
        }
    }
}

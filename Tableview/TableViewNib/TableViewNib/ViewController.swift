//
//  ViewController.swift
//  TableViewNib
//
//  Created by 심현석 on 2022/11/11.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var a = [List]()
    
    var b = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        tableView.rowHeight = 50
        
        fetchWeeklyWeather()
    }

    func fetchWeeklyWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=37.5683&lon=126.9778&appid=4221db2485f50f65a88a4f0fb8c42b69&lang=kr&units=metric") else {
            return print("error: URL 생성 실패")
        }
        let requestURL = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: requestURL) { data, response, error in
            
            if let error = error {
                return print("error1:", error)
            }
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                return print("error2:", error)
            }
            guard let data = data else {
                return print("error3:", error)
            }
            
            do {
                let decoder = JSONDecoder()
                let newData = try decoder.decode(WeatherData.self, from: data)
                
                self.a = newData.list
                //self.a.append(contentsOf: newdata)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error4:", error)
            }
        }
        .resume()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configure(with: a[indexPath.row].main)
        return cell
    }
}

//
//  APIManager.swift
//  naverAPI
//
//  Created by 심현석 on 2023/02/11.
//

import Foundation

//struct Coordinate {
//    var lat: Double
//    var lng: Double
//}

class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    var dataList = [Item]()
    typealias Coordinate = (lat: Double, lng: Double)
    var locationList = [(Double, Double)]()
    
    func Request(completion: (() -> Void)?) {
        let url = "http://apis.data.go.kr/B552584/EvCharger/getChargerInfo?serviceKey=W20dZ%2FzPRBLwO%2BOF9sBZ2CR9mMv6v6jiGm5dLqsyGBo%2BUA8My0qhvu%2BKDUVx4C0FUrERFo2IdDq75ECcQW%2Bdfw%3D%3D&numOfRows=100&pageNo=1&dataType=JSON"
        guard let url = URL(string: url) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(JSONData.self, from: data)
                self.dataList = data.items.item
                //print(self.dataList)
                self.switchStringToDouble(data: data.items.item)
                //print(self.locationList)
                completion?()
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func switchStringToDouble(data: [Item]) {
        data.forEach { item in
            guard let lat = Double(item.lat) else { return }
            guard let lng = Double(item.lng) else { return }
            self.locationList.append((lat, lng))
        }
    }
}


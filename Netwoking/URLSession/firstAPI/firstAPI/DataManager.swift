//
//  dataManager.swift
//  firstAPI
//
//  Created by 심현석 on 2022/10/10.
//

import UIKit

struct JSONResult: Codable {
    let results: [Music]
}

struct Music: Codable {
    let albumName: String?
    let albumImage: String?
    
    enum CodingKeys: String,CodingKey {
        case albumName = "collectionName"
        case albumImage = "artworkUrl100"
    }
}

struct DataManager {
    
    func fetchData(completion: @escaping ([Music]?) -> Void) {
        
        let urlString = "https://itunes.apple.com/search?media=music&term=blackpink"
        performRequest(with: urlString) { completion($0) }
    }
    
    func performRequest(with url: String, completion: @escaping ([Music]?) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            if let parseJSON = self.parseJSON(safeData) {
                completion(parseJSON)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ music: Data) -> [Music]? {
        
        do {
            let decodedData = try JSONDecoder().decode(JSONResult.self, from: music)

            return decodedData.results
        }
        catch {
            
            print("파싱 실패")
            return nil
        }
    }
}

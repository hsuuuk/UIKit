//
//  NetworkManager.swift
//  APITableViewLabel
//
//  Created by ์ฌํ์ on 2022/10/09.
//

import Foundation

struct MyBts: Codable {
    let results: [BtsResult]
}

struct BtsResult: Codable {
    let trackName: String
}

class NetworkManager {
    
    // ๐ ๋คํธ์ํน ์์ฒญํ๋ ํจ์
    func fetch(completion: @escaping ([BtsResult]?) -> Void) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bts"
        
        // ๐ฝ
        requestGet(with: urlString) { completion($0) }
    }
 
    // ๐ฝ ์ค์  Requestํ๋ ํจ์ (๋น๋๊ธฐ์  ์คํ -> ํด๋ก์  ๋ฐฉ์์ผ๋ก ๋๋ ์์ ์ ์ ๋ฌ ๋ฐ๋๋ก ์ค๊ณ)
    func requestGet(with urlString: String, completion: @escaping ([BtsResult]?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [self] (data, response, error) in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            // ๐๋ฉ์๋ ์คํํด์, ๊ฒฐ๊ณผ๋ฅผ ๋ฐ์
            if let bts = self.parseJSON(safeData) {
                print("Parse ์คํ")
                completion(bts)
            } else {
                print("Parse ์คํจ")
                completion(nil)
            }
        }
        task.resume()
    }
    
    // ์ํ๋ ๋ชจ๋ธ์ด ์๋ค๋ฉด, JSONDecoder๋ก decode์ฝ๋๋ก ๊ตฌํ
    // ๐ ๋ฐ์๋ณธ ๋ฐ์ดํฐ ๋ถ์ํ๋ ํจ์ (๋๊ธฐ์  ์คํ)
    func parseJSON(_ btsData: Data) -> [BtsResult]? {
        
        do {
            // ์ฐ๋ฆฌ๊ฐ ๋ง๋ค์ด ๋์ ๊ตฌ์กฐ์ฒด(ํด๋์ค ๋ฑ)๋ก ๋ณํํ๋ ๊ฐ์ฒด์ ๋ฉ์๋
            // JSON ๋ฐ์ดํฐ -> MyBts ๊ตฌ์กฐ์ฒด
            let btsData = try JSONDecoder().decode(MyBts.self, from: btsData)
            return btsData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

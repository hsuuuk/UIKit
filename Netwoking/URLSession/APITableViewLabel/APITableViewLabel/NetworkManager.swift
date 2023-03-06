//
//  NetworkManager.swift
//  APITableViewLabel
//
//  Created by 심현석 on 2022/10/09.
//

import Foundation

struct MyBts: Codable {
    let results: [BtsResult]
}

struct BtsResult: Codable {
    let trackName: String
}

class NetworkManager {
    
    // 🍊 네트워킹 요청하는 함수
    func fetch(completion: @escaping ([BtsResult]?) -> Void) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bts"
        
        // 🌽
        requestGet(with: urlString) { completion($0) }
    }
 
    // 🌽 실제 Request하는 함수 (비동기적 실행 -> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
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
            
            // 🍉메서드 실행해서, 결과를 받음
            if let bts = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(bts)
            } else {
                print("Parse 실패")
                completion(nil)
            }
        }
        task.resume()
    }
    
    // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현
    // 🍉 받아본 데이터 분석하는 함수 (동기적 실행)
    func parseJSON(_ btsData: Data) -> [BtsResult]? {
        
        do {
            // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
            // JSON 데이터 -> MyBts 구조체
            let btsData = try JSONDecoder().decode(MyBts.self, from: btsData)
            return btsData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

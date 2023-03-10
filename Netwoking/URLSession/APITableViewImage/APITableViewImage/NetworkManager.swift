//
//  NetworkManager.swift
//  APITableViewLabel
//
//  Created by μ¬νμ on 2022/10/09.
//

import Foundation

struct MyBts: Codable {
    let results: [BtsResult]
}

struct BtsResult: Codable {
    let albumimage: String
    
    enum CodingKeys: String, CodingKey {
        case albumimage = "artworkUrl100"
    }
}

class NetworkManager {
    
    // π λ€νΈμνΉ μμ²­νλ ν¨μ
    func fetch(completion: @escaping ([BtsResult]?) -> Void) {
        let urlString = "https://itunes.apple.com/search?media=music&term=newjeans"
        
        // π½
        requestGet(with: urlString) { completion($0) }
    }
 
    // π½ μ€μ  Requestνλ ν¨μ (λΉλκΈ°μ  μ€ν -> ν΄λ‘μ  λ°©μμΌλ‘ λλ μμ μ μ λ¬ λ°λλ‘ μ€κ³)
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
            
            // πλ©μλ μ€νν΄μ, κ²°κ³Όλ₯Ό λ°μ
            if let bts = self.parseJSON(safeData) {
                print("Parse μ€ν")
                completion(bts)
            } else {
                print("Parse μ€ν¨")
                completion(nil)
            }
        }
        task.resume()
    }
    
    // μνλ λͺ¨λΈμ΄ μλ€λ©΄, JSONDecoderλ‘ decodeμ½λλ‘ κ΅¬ν
    // π λ°μλ³Έ λ°μ΄ν° λΆμνλ ν¨μ (λκΈ°μ  μ€ν)
    func parseJSON(_ btsData: Data) -> [BtsResult]? {
        
        do {
            // μ°λ¦¬κ° λ§λ€μ΄ λμ κ΅¬μ‘°μ²΄(ν΄λμ€ λ±)λ‘ λ³ννλ κ°μ²΄μ λ©μλ
            // JSON λ°μ΄ν° -> MyBts κ΅¬μ‘°μ²΄
            let btsData = try JSONDecoder().decode(MyBts.self, from: btsData)
            return btsData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}


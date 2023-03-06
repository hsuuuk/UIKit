import UIKit

class NetworkManager {
    
    // 여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    //let musicURL = "https://itunes.apple.com/search?media=music"
    
    typealias NetworkCompletion = (Result<[BtsResult], NetworkError>) -> Void
    
    // 🍊네트워킹 요청하는 함수 (음악데이터 가져오기)
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompletion) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bts"
        print(urlString)
        
        // 🌽
        performRequest(with: urlString) { result in
            completion(result)
        }
        
    }
 
    // 🌽실제 Request하는 함수 (비동기적 실행 ===> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            // 🍉메서드 실행해서, 결과를 받음
            if let musics = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(.success(musics))
            } else {
                print("Parse 실패")
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현
    // 🍉받아본 데이터 분석하는 함수 (동기적 실행)
    private func parseJSON(_ musicData: Data) -> [BtsResult]? {
        
        // 성공
        do {
            // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
            // JSON 데이터 -> MusicData 구조체
            let musicData = try JSONDecoder().decode(MyBts.self, from: musicData)
            return musicData.results
        // 실패
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

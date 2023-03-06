import UIKit
/*:
 ## 네트워크 통신(서버와의 통신)의 기초
 * 요청(Request) ➡︎ 서버데이터(JSON) ➡︎ 분석(Parse) ➡︎ 변환 (우리가 쓰려는 Struct/Class)
 ---
 */
// 📌서버에서 주는 데이터
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
    
    // 💡네트워크에서 주는 이름을 변환하는 방법
    // let 바꾼이름
    // case 바꾼이름 = "원래이름"(하나만 바꾸더라도 모든 케이스 입력)
//    enum CodingKeys: String, CodingKey {
//        case rank: String
//        case movieNm = "movieNumber"
//        case audiCnt: String
//        case audiAcc: String
//        case openDt: String
//    }
}

// 📌내가 만들고 싶은 데이터(우리가 쓰려는 Struct / Class)
struct Movie {
    let movieName: String
    let rank: Int
    let openDate: String
    let todayAudience: Int
    let totalAudience: Int
    
    init(movieNm: String, rank: String, openDate: String, audiCnt: String, accAudi: String) {
        self.movieName = movieNm
        self.rank = Int(rank)!
        self.openDate = openDate
        self.todayAudience = Int(audiCnt)!
        self.totalAudience = Int(accAudi)!
    }
}

// 📌서버와 통신
struct DataManager {
    let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    let Key = "7a526456eb8e084eb294715e006df16f"
    
    func fetchData(completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(url)&key=\(Key)"
        performRequest(with: urlString) { completion($0) } // 🍏
    }
    
    func performRequest(with urlString: String, completion: @escaping ([Movie]?) -> Void) { // 🍏
        // 1. URL 구조체 만들기
        guard let url = URL(string: urlString) else { return }
        // 2. URLSession 만들기 (네트워킹을 하는 객체 - 브라우저 같은 역할)
        let session = URLSession(configuration: .default)
        // 3. 세션에 작업 부여
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            guard let safeData = data else {
                completion(nil)
                return
            }
            // 받아온 데이터를 쓰기 좋게 변환하는 과정(JSONDecoder)
            if let parseJSON = self.parseJSON(safeData) { // 🍎
                completion(parseJSON)
            } else {
                completion(nil)
            }
        }
        // 4. 작업 시작
        task.resume()
    }
    
    func parseJSON(_ movieData: Data) -> [Movie]? { // 🍎
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: movieData)
            
            let dailyLists = decodedData.boxOfficeResult.dailyBoxOfficeList

            // 🥕반복문으로 배열 생성
//            var myMovielists = [Movie]()
//
//            for movie in dailyLists {
//                let name = movie.movieNm
//                let rank = movie.rank
//                let openDate = movie.openDt
//                let todayAudi = movie.audiCnt
//                let accAudi = movie.audiAcc
//
//                let myMovie = Movie(movieNm: name, rank: rank, openDate: openDate, audiCnt: todayAudi, accAudi: accAudi)
//
//                myMovielists.append(myMovie)
//            }
            
            // 🥕고차함수로 배열 생성
            let myMovielists = dailyLists.map {
                Movie(movieNm: $0.movieNm, rank: $0.rank, openDate: $0.openDt, audiCnt: $0.audiCnt, accAudi: $0.audiAcc)
            }
            
            return myMovielists
        }
        catch {
            print("파싱 실패")
            return nil
        }
    }
}

// 📌뷰컨트롤러
var arr = [Movie]() // 빈배열

let dataManager = DataManager()

// 실제 다운로드 코드
func setupNetwork() {
    dataManager.fetchData() { arr = $0! }
}

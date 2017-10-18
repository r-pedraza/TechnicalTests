import Foundation
import AlamofireObjectMapper
import Alamofire

class APIClient {
    
    let apiKey = "api-key=32534511931e4dc1b5627b6918ca0d6b"
    let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostshared/all-sections/"
 

    func loadNews(completion: @escaping ([SearchNewsResults])-> Void) {
        let URL = "https://api.nytimes.com/svc/mostpopular/v2/mostshared/all-sections/facebook;twitter/30.json?api-key=32534511931e4dc1b5627b6918ca0d6b"
        Alamofire.request(URL).responseObject { (response: DataResponse<NewsResults>) in
            let result = response.result.value
            guard let news = result?.news else { return completion([])}
            completion(news)
        }
    }
}

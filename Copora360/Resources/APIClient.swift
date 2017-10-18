import Foundation
import Alamofire

class APIClient {
    
    let apiKey = "api-key=32534511931e4dc1b5627b6918ca0d6b"
    let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostshared/all-sections/"
 

    func loadNews() {
      
        Alamofire.request("https://api.nytimes.com/svc/mostpopular/v2/mostshared/all-sections/facebook;twitter/30.json?api-key=32534511931e4dc1b5627b6918ca0d6b").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let news = try container.decode([SearchNewsResultsModels].self, forKey: .weather)
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}

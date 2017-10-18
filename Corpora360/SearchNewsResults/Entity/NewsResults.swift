import Foundation
import ObjectMapper

class NewsResults: Mappable {
    
    var news: [SearchNewsResults]?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        news <- map["results"]
    }
}

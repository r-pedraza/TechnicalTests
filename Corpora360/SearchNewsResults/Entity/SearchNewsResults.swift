import Foundation
import ObjectMapper

class SearchNewsResults: Mappable {
   
    var url: String?
    var title: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        url <- map["url"]
        title <- map["title"]
    }
}

import UIKit

class SearchNews {
    var firstOption: String
    var secondOption: String
    var twitter: Bool
    var facebook: Bool
    var twitterString: String = "" {
        didSet {
            twitterString = twitter ? "twitter" : ""
        }
    }
    var facebookString: String = "" {
        didSet {
            facebookString = facebook ? "facebook" : ""
        }
    }
    
    init(firstOption: String, secondOption: String, twitter: Bool, facebook: Bool) {
        self.firstOption = firstOption
        self.secondOption = secondOption
        self.twitter = twitter
        self.facebook = facebook
    }
}

import UIKit

class SearchNewsInteractor: SearchNewsInteractorProtocol {
        
  var presenter: SearchNewsPresenterProtocol?
    
    var dataForFirstOption: [String] {
        return ["mostemailed", "mostshared", "mostviewed"]
    }
    
    var dataForSecondOption: [String] {
        return ["1", "7", "30"]
    }
    
    var dataForThreeOption: [String] {
        return ["facebook", "twitter"]
    }
}

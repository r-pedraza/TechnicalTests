import UIKit
import Alamofire

class SearchNewsResultsInteractor: SearchNewsResultsInteractorProtocol {
  var presenter: SearchNewsResultsPresenterProtocol!    

    func loadNewsResults() {
        APIClient().loadNews()
    }
}

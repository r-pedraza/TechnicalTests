import UIKit
import Alamofire

class SearchNewsResultsInteractor: SearchNewsResultsInteractorProtocol {
  var presenter: SearchNewsResultsPresenterProtocol!    

    init() {
        loadNewsResults()
    }
    func loadNewsResults() {
        APIClient().loadNews {
            self.presenter.reloadData(with: $0)
        }
    }
}

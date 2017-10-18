import UIKit

class SearchNewsResultsPresenter: SearchNewsResultsPresenterProtocol {
    weak var view: SearchNewsResultsViewProtocol!
    var interactor: SearchNewsResultsInteractorProtocol!
    var routing: SearchNewsResultsRoutingProtocol!
}


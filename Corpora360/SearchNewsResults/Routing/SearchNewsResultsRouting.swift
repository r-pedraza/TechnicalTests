import UIKit

class SearchNewsResultsRouting: SearchNewsResultsRoutingProtocol {
    var viewController: SearchNewsResultsViewController!

    
    init(viewController: SearchNewsResultsViewController) {
        self.viewController = viewController
        setup()
    }
    
    
    private func setup() {
        let interactor = SearchNewsResultsInteractor()
        let presenter = SearchNewsResultsPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.routing = self
        viewController.presenter = presenter
    }
  
}

import UIKit

class SearchNewsResultsRouting: SearchNewsResultsRoutingProtocol {
    var navigationController: UINavigationController?
    var viewController: SearchNewsResultsViewController?

    
    init(navigationController: UINavigationController, viewController: SearchNewsResultsViewController) {
        self.navigationController = navigationController
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

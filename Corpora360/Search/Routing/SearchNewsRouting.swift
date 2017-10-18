import UIKit

class SearchNewsRouting: SearchNewsRoutingProtocol {
  var navigationController: UINavigationController
  var viewController: SearchNewsViewController
    
    init(navigationController: UINavigationController, viewController: SearchNewsViewController) {
        self.navigationController = navigationController
        self.viewController = viewController
        setup()
    }
    
    private func setup() {
        let interactor = SearchNewsInteractor()
        let presenter = SearchNewsPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.routing = self
        viewController.presenter = presenter
    }
    
    func goToSearchNewsResults() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SearchNewsResultsViewControllerID")
        navigationController.pushViewController(controller, animated: true)
    }
  
}

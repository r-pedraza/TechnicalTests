import UIKit

class SearchNewsResultsRouting: SearchNewsResultsRoutingProtocol {
    var viewController: SearchNewsResultsViewController!

    
    init(viewController: SearchNewsResultsViewController) {
        self.viewController = viewController
        setup()
    }
    
    func presentWebView(with url: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newsDetailViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewControllerID") as! NewsDetailViewController
        let _ = NewsDetailRouting(viewController: newsDetailViewController, url: url)
        viewController.present(newsDetailViewController, animated: true, completion: nil)
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

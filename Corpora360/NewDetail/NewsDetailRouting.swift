import UIKit

class NewsDetailRouting: NewsDetailRoutingProtocol {
    var viewController: NewsDetailViewController!
    var url: String
    
    init(viewController: NewsDetailViewController, url: String) {
        self.viewController = viewController
        self.url = url
        setup()
    }
    
    private func setup() {
        let interactor = NewsDetailInteractor(url: url)
        let presenter = NewsDetailPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.routing = self
        viewController.presenter = presenter
    }

}

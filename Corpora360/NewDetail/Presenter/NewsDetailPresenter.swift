import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol {
    weak var view: NewsDetailViewProtocol!
    var interactor: NewsDetailInteractorProtocol!
    var routing: NewsDetailRoutingProtocol!
   
    func loadURL() {
        if let request = interactor.urlRequest {
            view.wkWebViewReference.load(request)
        }
    }
}

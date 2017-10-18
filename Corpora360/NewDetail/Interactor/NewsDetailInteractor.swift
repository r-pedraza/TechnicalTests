import Foundation

class NewsDetailInteractor: NewsDetailInteractorProtocol {
    var presenter: NewsDetailPresenterProtocol!
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var urlRequest: URLRequest? {
        guard let url = URL(string: url) else { return nil}
        return URLRequest(url: url)
    }

}

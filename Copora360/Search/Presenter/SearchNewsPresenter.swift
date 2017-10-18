import UIKit

class SearchNewsPresenter: SearchNewsPresenterProtocol {
  weak var view: SearchNewsViewProtocol?
  var interactor: SearchNewsInteractorProtocol?
}

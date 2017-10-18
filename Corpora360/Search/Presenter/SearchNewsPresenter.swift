import UIKit

class SearchNewsPresenter: SearchNewsPresenterProtocol {
  
    weak var view: SearchNewsViewProtocol!
    var interactor: SearchNewsInteractorProtocol!
    var routing: SearchNewsRoutingProtocol!
    var searchNews = SearchNews()
    var items = [String]()
    
    func didTapInButton(with button: UIButton) {
        
        switch button.tag {
        case 1:
            view.pickerViewReference.tag = 1
            items = interactor.dataForFirstOption
            loadPickerView(with: items)
        case 2:
            view.pickerViewReference.tag = 2
            items = interactor.dataForSecondOption
            loadPickerView(with: items)
        default:
            view.pickerViewReference.tag = 3
            items = interactor.dataForThreeOption
            loadPickerView(with: items)
        }
    }
    
    var numberOfComponents: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return items.count
    }
    
    func title(forRow: Int) -> String {
        return items[forRow]
    }
    
    func update(with tag: Int, row: Int) {
        switch tag {
        case 1:
            searchNews.firstOption = items[row]
        case 2:
            searchNews.secondOption = items[row]
        default:
            searchNews.threeOption = items[row]
        }
    }
    
    func goToSearchNewsResults() {
        routing.goToSearchNewsResults()
    }
    
    // MARK: Private Methods
    
    private func loadPickerView(with data: [String]) {
        view.pickerViewReference.isHidden = false
        view.toolbarReference.isHidden = false
        view.pickerViewReference.reloadAllComponents()
    }
    
}


import UIKit

class SearchNewsPresenter: SearchNewsPresenterProtocol {
  
    weak var view: SearchNewsViewProtocol!
    var interactor: SearchNewsInteractorProtocol!
    var routing: SearchNewsRoutingProtocol!
    var searchNews: SearchNews!
    var items = [String]()
    
    func setup() {
        searchNews = SearchNews(firstOption: "mostemailed", secondOption: "1", twitter: false, facebook: false)
    }
    
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
            
        case 3:
            view.facebookButtonReference.isSelected = !view.facebookButtonReference.isSelected
            searchNews.facebook = view.facebookButtonReference.isSelected
            searchNews.facebookString = searchNews.facebook ? "facebook" : ""
            view.facebookButtonReference.titleLabel?.tintColor =  view.facebookButtonReference.isSelected ? .green : .red
        default:
            view.twitterButtonReference.isSelected = !view.twitterButtonReference.isSelected
            searchNews.twitter = view.twitterButtonReference.isSelected
            searchNews.twitterString = searchNews.twitter ? "twitter" : ""
            view.twitterButtonReference.titleLabel?.tintColor =  view.twitterButtonReference.isSelected ? .green : .red
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
            view.firstOptionLabelReference.text = searchNews.firstOption
        case 2:
            searchNews.secondOption = items[row]
            view.secondOptionLabelReference.text = searchNews.secondOption
        case 3:
            view.facebookButtonReference.isSelected = !view.facebookButtonReference.isSelected
        default:
            view.twitterButtonReference.isSelected = !view.twitterButtonReference.isSelected
        }
        showOrHiddenButtons(with: searchNews.firstOption)
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
    
    func showOrHiddenButtons(with value: String) {
        if value == "mostshared" {
            view.facebookButtonReference.isHidden = false
            view.twitterButtonReference.isHidden = false
        } else {
            view.facebookButtonReference.isHidden = true
            view.twitterButtonReference.isHidden = true
        }
    }
}


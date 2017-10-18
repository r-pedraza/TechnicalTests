import UIKit

class SearchNewsResultsPresenter: SearchNewsResultsPresenterProtocol {
    weak var view: SearchNewsResultsViewProtocol!
    var interactor: SearchNewsResultsInteractorProtocol!
    var routing: SearchNewsResultsRoutingProtocol!
    var news = [SearchNewsResults]()
    
    var numberOfSections: Int {
        return 1
    }

    var numberOfRowsInSection: Int {
        return news.count
    }
    
    func reloadData(with newsResults: [SearchNewsResults]) {
        news = newsResults
        view.tableViewreference.reloadData()
    }
    
    func setupCell(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let new = news[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCellID", for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = new.title
        return cell
    }
}


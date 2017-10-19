import UIKit

class SearchNewsResultsPresenter: SearchNewsResultsPresenterProtocol {
    weak var view: SearchNewsResultsViewProtocol!
    var interactor: SearchNewsResultsInteractorProtocol!
    var routing: SearchNewsResultsRoutingProtocol!
    var news = [SearchNewsResults]()
    var factoryCell: TableCellFactory!
    
    func setup() {
        factoryCell = TableCellFactory(tableView: view.tableViewreference)
    }
    
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
        let cell: NewsTableViewCell = factoryCell.createCell(viewModel: new, indexPath: indexPath)
        return cell
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let newsDetail = news[indexPath.row]
        if let url = newsDetail.url {
            routing.presentWebView(with: url)
        }
    }
}


import UIKit

protocol SearchNewsResultsPresenterProtocol {
    var numberOfSections: Int { get }
    var numberOfRowsInSection: Int { get }
    func reloadData(with newsResults: [SearchNewsResults])
    func setupCell(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

import UIKit

protocol SearchNewsPresenterProtocol {
    var numberOfComponents: Int { get }
    var numberOfRows: Int { get }
    func didTapInButton(with button: UIButton)
    func title(forRow: Int) -> String
    func update(with tag: Int, row: Int)
    func goToSearchNewsResults()
}

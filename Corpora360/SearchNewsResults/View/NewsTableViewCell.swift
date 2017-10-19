import UIKit

class NewsTableViewCell: BaseTableViewCell<SearchNewsResults> {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func setupGUI() {
        titleLabel.text = viewModel.title
    }
}

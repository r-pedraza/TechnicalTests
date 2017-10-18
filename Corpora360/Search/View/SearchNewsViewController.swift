import UIKit

class SearchNewsViewController: UIViewController, SearchNewsViewProtocol {
    
    var presenter: SearchNewsPresenterProtocol!

    @IBOutlet weak var searchFirstOptionButton: UIButton!
    @IBOutlet weak var searchSecondOptionButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var firstOptionLabel: UILabel!
    @IBOutlet weak var secondOptionLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        if let navigationController = navigationController {
            _ = SearchNewsRouting(navigationController: navigationController, viewController: self)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.setup()
    }
    
    // MARK: Private Methods
    
    private func setupUI() {
        title = "Search News"
        searchFirstOptionButton.tag = 1
        searchSecondOptionButton.tag = 2
        searchFirstOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        searchSecondOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        facebookButton.tag = 3
        twitterButton.tag = 4
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
        toolbar.isHidden = true
        facebookButton.isHidden = true
        twitterButton.isHidden = true
    }
    
    // MARK: Actions
    
    @IBAction func didTapInFirstOptionButton(_ sender: UIButton) {
        presenter?.didTapInButton(with: sender)
    }
    
    @IBAction func didTapInSecondOptionButton(_ sender: UIButton) {
        presenter?.didTapInButton(with: sender)
    }
    
    @IBAction func didTapInFacebookButton(_ sender: UIButton) {
        presenter?.didTapInButton(with: sender)
    }
    
    @IBAction func didTapInTwitterButton(_ sender: UIButton) {
        presenter?.didTapInButton(with: sender)
    }
    
    @IBAction func didTapInDoneButton(_ sender: Any) {
        pickerView.isHidden = true
        toolbar.isHidden = true
    }
    
    @IBAction func didTapInSearchButton(_ sender: Any) {
        presenter.goToSearchNewsResults()
    }
    
    // MARK: ViewProtocol

    var pickerViewReference: UIPickerView {
        return pickerView
    }
    
    var mainViewReference: UIView {
        return view
    }
    
    var toolbarReference: UIToolbar {
        return toolbar
    }
    
    var firstOptionButtonReference: UIButton {
        return searchFirstOptionButton
    }
    
    var secondOptionButtonReference: UIButton {
        return searchSecondOptionButton
    }
    
    var facebookButtonReference: UIButton {
        return facebookButton
    }
    
    var twitterButtonReference: UIButton {
        return twitterButton
    }
    
    var firstOptionLabelReference: UILabel {
        return firstOptionLabel
    }
    
    var secondOptionLabelReference: UILabel {
        return secondOptionLabel
    }

}

extension SearchNewsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return presenter.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return presenter.title(forRow: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presenter.update(with: pickerView.tag, row: row)
    }
}

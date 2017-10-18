import UIKit
import WebKit

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {
    
    var presenter: NewsDetailPresenterProtocol!

    @IBOutlet weak var wkWebView: WKWebView!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadURL()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
 
    // MARK: NewsDetailViewProtocol
    
    var wkWebViewReference: WKWebView {
        return wkWebView
    }
    
    @IBAction func didTapInDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

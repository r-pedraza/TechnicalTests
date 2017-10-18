import UIKit

protocol SearchNewsViewProtocol: class {
    var mainViewReference: UIView { get }
    var pickerViewReference: UIPickerView { get }
    var toolbarReference: UIToolbar { get }
    var facebookButtonReference: UIButton { get }
    var twitterButtonReference: UIButton { get }
    var firstOptionButtonReference: UIButton { get }
    var secondOptionButtonReference: UIButton { get }
    var firstOptionLabelReference: UILabel { get }
    var secondOptionLabelReference: UILabel { get }
}

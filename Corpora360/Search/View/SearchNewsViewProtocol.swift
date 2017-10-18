import UIKit

protocol SearchNewsViewProtocol: class {
    var mainViewReference: UIView { get }
    var pickerViewReference: UIPickerView { get }
    var toolbarReference: UIToolbar { get }
}

import UIKit

extension UISearchBar {
  var textField: UITextField? {
    get {
      if #available(iOS 13, *) {
        return searchTextField
      }
      let subViews = subviews.flatMap { $0.subviews }
      guard let textField = (subViews.filter {$0 is UITextField }).first as? UITextField else {
        return nil
      }
      return textField
    }
  }
  
}

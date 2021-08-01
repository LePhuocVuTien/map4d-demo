import UIKit

extension UIView {
  static var reuseID: String {
    return String(describing: self)
  }
  
  static func line() -> UIView {
    let view = UIView()
    view.backgroundColor = R.color.line()
    view.alpha = 0.5
    return view
  }
}

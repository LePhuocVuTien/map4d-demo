import UIKit

public class NavigationController: UINavigationController {
  public init() {
    super.init(nibName: nil, bundle: nil)
    navigationBar.isHidden = true
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

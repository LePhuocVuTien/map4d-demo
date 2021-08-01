import UIKit
import SnapKit

class Scene: UIViewController  {
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  public override func loadView() {
    view = UIView()
    view.backgroundColor = .white
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

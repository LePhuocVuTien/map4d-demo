
import UIKit

public protocol Navigator: class {
  var navigationController: NavigationController { get }
  func start()
  func dismiss()
}

import UIKit

extension UITabBarController {
  enum TabBarItem: CaseIterable{
    case saved
    case main
    case option
    
    var name: String {
      switch self {
      case .saved:
        return "Saved"
      case .main:
        return "Home"
      case .option:
        return "Option"
      }
    }
    
    var icon: UIImage? {
      switch self {
      case .saved:
        return R.image.saved()
      case .main:
        return R.image.homeBlue()
      case .option:
        return R.image.option()
      }
    }
    
    var selectIcon: UIImage? {
      switch self {
      case .saved:
        return nil
      case .main:
        return nil
      case .option:
        return nil
      }
    }
  }
}

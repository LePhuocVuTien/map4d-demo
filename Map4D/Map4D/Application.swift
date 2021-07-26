import UIKit

class Application {
  
  var window: UIWindow!
  static let shared = Application()
  
  func start() {
    assert(window != nil, "window was NOT set")
    
    let navigators: [Navigator] = [
      SavedNavigator(navigationController: NavigationController()),
      HomeNavigator(navigationController: NavigationController()),
      OptionsNavigator(navigationController: NavigationController())
    ]
    window.rootViewController = AppController(navigators: navigators)
    window.makeKeyAndVisible()
  }
}

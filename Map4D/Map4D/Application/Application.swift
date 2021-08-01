import UIKit
import Domain
import NetworkPlatform
import CoreDataPlatform

final class Application {
  
  static let shared = Application()
  private let useCaseProvider: Domain.UseCaseProvider
  
  private init() {
    self.useCaseProvider = NetworkPlatform.UseCaseProvider()
    UIFont.registerCustomFonts()
  }
  
  func configure(in window: UIWindow) {
    let savedNavigator = DefaultSavedNavigator(
      services: useCaseProvider,
      navigationController: NavigationController()
    )
    
    let homeNavigator = DefaultHomeNavigator(
      services: useCaseProvider,
      navigationController: NavigationController()
    )
    
    let optionsNavigator = DefaultOptionsNavigator(
      services: useCaseProvider,
      navigationController: NavigationController()
    )
    
    let navigators: [Navigator] = [
      savedNavigator,
      homeNavigator,
      optionsNavigator
    ]
    window.rootViewController = TabBarController(navigators: navigators)
    window.makeKeyAndVisible()
  }
}

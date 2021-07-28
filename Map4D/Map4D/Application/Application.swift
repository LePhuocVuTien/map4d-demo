import UIKit
import Domain
import NetworkPlatform
import CoreDataPlatform

final class Application {
  
  static let shared = Application()
  private let networkUseCaseProvider: Domain.UseCaseProvider
  
  private init() {
    self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
  }
  
  func configure(in window: UIWindow) {
    let savedNavigator = DefaultSavedNavigator(
      services: networkUseCaseProvider,
      navigationController: NavigationController()
    )
    
    let homeNavigator = DefaultHomeNavigator(
      services: networkUseCaseProvider,
      navigationController: NavigationController()
    )
    
    let optionsNavigator = DefaultOptionsNavigator(
      services: networkUseCaseProvider,
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

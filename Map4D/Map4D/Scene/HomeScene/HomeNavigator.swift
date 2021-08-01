import UIKit
import Domain
import NetworkPlatform

protocol HomeNavigator: Navigator {
  func toSearch()
}

class DefaultHomeNavigator: HomeNavigator {
  private let services: Domain.UseCaseProvider
  let navigationController: NavigationController
  
  init( services: Domain.UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = HomeViewModel(useCase: services.makeHomeUseCase(), navigator: self)
    let scene = HomeScene()
    scene.viewModel = viewModel
    navigationController.show(scene, sender: nil)
  }
  
  func toSearch() {
    let navigator = DefaultSearchNavigator(
      services: NetworkPlatform.UseCaseProvider(),
      navigationController: navigationController
    )
    navigator.toScene()
  }
}

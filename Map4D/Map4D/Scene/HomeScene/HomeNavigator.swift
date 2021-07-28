import UIKit
import Domain

protocol HomeNavigator: Navigator {
  func toSearch()
}

class DefaultHomeNavigator: HomeNavigator {
  private let services: UseCaseProvider
  let navigationController: NavigationController
  
  init( services: UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = HomeViewModel(useCase: services.makeScenesUseCase(), navigator: self)
    let scene = HomeScene()
    scene.viewModel = viewModel
    navigationController.show(scene, sender: nil)
  }
  
  func toSearch() {
    print("toSearch")
  }
}

import UIKit
import Domain

protocol SearchNavigator: Navigator {
  func toGroupDetail()
}

class DefaultSearchNavigator: SearchNavigator {
  
  private let services: UseCaseProvider
  let navigationController: NavigationController
  
  init(services: UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = SearchViewModel(useCase: services.makeScenesUseCase(), navigator: self)
    let scene = SearchScene()
    scene.viewModel = viewModel
    navigationController.show(scene, sender: nil)
  }
  
  func toGroupDetail() {
    print("toGroupDetail")
  }
}

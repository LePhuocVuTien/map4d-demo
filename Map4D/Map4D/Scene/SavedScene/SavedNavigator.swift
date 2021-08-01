import UIKit
import Domain

protocol SavedNavigator: Navigator {
  func toGroupDetail()
}

class DefaultSavedNavigator: SavedNavigator {
  
  private let services: Domain.UseCaseProvider
  let navigationController: NavigationController
  
  init(services: Domain.UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = SavedViewModel(useCase: services.makeSavedUseCase(), navigator: self)
    let scene = SavedScene()
    scene.viewModel = viewModel
    navigationController.show(scene, sender: nil)
  }
  
  func toGroupDetail() {
    print("toGroupDetail")
  }
}

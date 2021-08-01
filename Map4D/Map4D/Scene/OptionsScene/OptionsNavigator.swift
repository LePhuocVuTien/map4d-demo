import UIKit
import Domain

protocol OptionsNavigator: Navigator {
  func toApplicationInfo()
}

class DefaultOptionsNavigator: OptionsNavigator {
  private let services: Domain.UseCaseProvider
  let navigationController: NavigationController
  
  init(services: Domain.UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = OptionsViewModel(useCase: services.makeOptionsUseCase(), navigator: self)
    let scene = OptionsScene()
    scene.viewModel = viewModel
    navigationController.show(scene, sender: nil)
  }
  
  func toApplicationInfo() {
    print("toApplicationInfo")
  }
}

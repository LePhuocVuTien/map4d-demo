import UIKit
import Domain

protocol SearchNavigator: Navigator {
  func toDismiss()
}

class DefaultSearchNavigator: SearchNavigator {
  
  private let services: UseCaseProvider
  let navigationController: NavigationController
  
  init(services: UseCaseProvider, navigationController: NavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toScene() {
    let viewModel = SearchViewModel(useCase: services.makeSearchUseCase(), navigator: self)
    let scene = SearchScene()
    scene.modalPresentationStyle = .fullScreen
    scene.viewModel = viewModel
    navigationController.present(scene, animated: true, completion: nil)
  }
  
  func toDismiss() {
    navigationController.dismiss(animated: true, completion: nil)
  }
}

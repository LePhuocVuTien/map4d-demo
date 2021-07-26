import UIKit
import ViewModel

class HomeNavigator: HomeSceneNavigator {
  
  let navigationController: NavigationController
  
  var appController: AppController? {
    return UIApplication.shared.delegate?.window??.rootViewController as? AppController
  }
  
  init(navigationController: NavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let viewModel = HomeViewModel()
    let scene = HomeScene(viewModel: viewModel)
    scene.view.backgroundColor = .white
    navigationController.show(scene, sender: nil)
    print("start")
  }
  
  func dismiss() {
    exit(0)
  }
  
  func showFirstLaunchScene() {
    print("showFirstLaunchScene")
  }
  
}

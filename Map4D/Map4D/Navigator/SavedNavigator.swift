import UIKit

class SavedNavigator: SavedSceneNavigator {
  
  let navigationController: NavigationController
  
  var appController: AppController? {
    return UIApplication.shared.delegate?.window??.rootViewController as? AppController
  }
  
  init(navigationController: NavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let scene = SavedScene()
    scene.view.backgroundColor = .white
    navigationController.show(scene, sender: nil)
  }
  
  func dismiss() {
    exit(0)
  }
  
}

import UIKit

public class TabBarController: UITabBarController {
  
  let navigators: [Navigator]
  private var items: [TabBarItem] = TabBarItem.allCases
  
  init(navigators: [Navigator]) {
    self.navigators = navigators
    super.init(nibName: nil, bundle: nil)
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setting()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setting() {
    UITabBarItem.appearance().setTitleTextAttributes(
      [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)],
      for: .normal
    )
    
    viewControllers = navigators.map { $0.navigationController }
    selectedIndex = 1
    for i in 0..<navigators.count {
      navigators[i].navigationController.tabBarItem = UITabBarItem(
        title: items[i].name,
        image: items[i].icon,
        selectedImage: nil)
      navigators[i].toScene()
    }
  }
}

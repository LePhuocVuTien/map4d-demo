import UIKit
import Map4dMap
import SnapKit
import RxCocoa
import RxSwift

class SavedScene: Scene {
  
  private let disposeBag = DisposeBag()
  var viewModel: SavedViewModel!
  
  lazy var content = ContentView(frame: .zero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    content.backgroundColor = .red
  }
  
  override func loadView() {
    super.loadView()
    bindViewModel()
    setupViews()
    setConstaint()
  }
  
  private func bindViewModel() {
    
    let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .mapToVoid()
    
    let input = SavedViewModel.Input(trigger: viewWillAppear.asDriverOnErrorJustComplete())
    let output = viewModel.transform(input: input)
    
//    output.result
//      .drive(onNext: { [weak self] item in
//        self?.alert(item: item.place)
//      })
//      .disposed(by: disposeBag)
  }
  
  private func setConstaint() {
    content.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  private func setupViews() {
    view.addSubview(content)
  }
}


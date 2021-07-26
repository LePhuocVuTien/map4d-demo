import UIKit
import Map4dMap
import SnapKit
import RxCocoa
import RxSwift
import ViewModel
import Model
import RxAlamofire

class HomeScene: Scene {
  
  lazy var content = ContentView(frame: .zero)
  var poiBehaviorRelay = BehaviorRelay<String?>(value: nil)
  let disposeBag = DisposeBag()
  
  let viewModel: HomeViewModel
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func loadView() {
    super.loadView()
    setBinding()
    setupViews()
    setConstaint()
  }
  
  private func setBinding() {
    content.mapView.delegate = self
    
    let idTriger = poiBehaviorRelay
      .flatMapLatest { id -> Driver<String> in
        if let id = id {
          return Driver.of(id)
        }
        return .empty()
      }
      .asDriverOnErrorJustComplete()
    
    let input = HomeViewModel.Input(idTriger: idTriger)
    let output = viewModel.transform(input: input)
    
    output.result
      .drive(onNext: { [weak self] item in
        self?.alert(item: item.place)
      })
      .disposed(by: disposeBag)
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

extension HomeScene: MFMapViewDelegate {
  func mapView(
    _ mapView: MFMapView!,
    didTapPOIWithPlaceID placeID: String!,
    name: String!,
    location: CLLocationCoordinate2D
  ) {
    poiBehaviorRelay.accept(placeID)
  }
}


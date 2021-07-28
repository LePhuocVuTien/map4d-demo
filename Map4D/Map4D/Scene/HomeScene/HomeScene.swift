import UIKit
import Map4dMap
import SnapKit
import RxCocoa
import RxSwift

class HomeScene: Scene {
  
  private let disposeBag = DisposeBag()
  var viewModel: HomeViewModel!
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
    assert(viewModel != nil)
    content.mapView.delegate = self
//    
//    let idTriger = poiBehaviorRelay
//      .flatMapLatest { id -> Driver<String> in
//        if let id = id {
//          return Driver.of(id)
//        }
//        return .empty()
//      }
//      .asDriverOnErrorJustComplete()
//    
    let input = HomeViewModel.Input()
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

extension HomeScene: MFMapViewDelegate {
  func mapView(
    _ mapView: MFMapView!,
    didTapPOIWithPlaceID placeID: String!,
    name: String!,
    location: CLLocationCoordinate2D
  ) {
    print(name)
  }
}


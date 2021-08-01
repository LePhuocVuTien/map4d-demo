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
    
    let viewWillAppear = rx
      .sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    
    let gestureSearch = UITapGestureRecognizer()
    content.searchView.addGestureRecognizer(gestureSearch)
    let searchTrigger = gestureSearch.rx
      .event
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    
    let input = HomeViewModel.Input(
      trigger: viewWillAppear,
      searchTriger: searchTrigger
    )
    
    let output = viewModel.transform(input: input)
    
    output.searchResult
      .drive()
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
    print(name ?? "")
  }
}


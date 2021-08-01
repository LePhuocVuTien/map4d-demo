import UIKit
import Map4dMap
import SnapKit
import RxCocoa
import RxSwift
import RxDataSources

class SearchScene: Scene {
  
  typealias ElementData = SearchViewModel.Element
  private let disposeBag = DisposeBag()
  var viewModel: SearchViewModel!
  
  private lazy var dataSource: RxTableDataSource = {
    return createDataSource()
  }()
  
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
    content.searchBar.backButton.rx.tap
      .subscribe(onNext: { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
      })
      .disposed(by: disposeBag)
    
    let queryTrigger = content.searchBar.textField!.rx
      .text
      .orEmpty
      .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
    
    let input = SearchViewModel.Input(textTrigger: queryTrigger.asDriverOnErrorJustComplete())
    let output = viewModel.transform(input: input)
    
    output.createSearch
      .drive(content.tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    
    output.error
      .drive(onNext: { error in
        dump(error)
        print(error.localizedDescription)
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

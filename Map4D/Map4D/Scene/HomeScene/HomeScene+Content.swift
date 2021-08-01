import UIKit
import Map4dMap

extension HomeScene {
  class ContentView: UIView {
    
    lazy var mapView = MFMapView(frame: .zero)
    lazy var searchView = SearchBar()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
      setConstraint()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      addSubview(mapView)
      addSubview(searchView)
    }
    
    private func setConstraint() {
      mapView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
      
      searchView.snp.makeConstraints {
        $0.left.equalToSuperview().offset(16.0)
        $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10.0)
        $0.right.equalToSuperview().inset(80.0)
        $0.height.equalTo(48.0)
      }
    }
  }
}

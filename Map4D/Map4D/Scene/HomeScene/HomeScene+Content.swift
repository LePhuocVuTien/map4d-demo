import UIKit
import Map4dMap

extension HomeScene {
  class ContentView: UIView {
    
    lazy var mapView = MFMapView(frame: .zero)
    
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
    }
    
    private func setConstraint() {
      mapView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
}

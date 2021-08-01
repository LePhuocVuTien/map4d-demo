import UIKit
import Map4dMap

extension SearchScene {
  
  class ContentView: UIView {
    lazy var searchBar = SearchBar()
    
    lazy var shadowTable: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 4
      view.layer.shadowColor = R.color.main()?.cgColor
      view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
      view.layer.shadowRadius = 4.0
      view.layer.shadowOpacity = 0.4
      return view
    }()
    
    lazy var tableView: UITableView = {
      let tableView = UITableView(frame: .zero)
      tableView.separatorStyle = .none
      tableView.showsVerticalScrollIndicator = false
      tableView.layer.cornerRadius = 4
      tableView.register(Cell.self)
      
      return tableView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
      setConstraint()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      addSubview(searchBar)
      addSubview(shadowTable)
      addSubview(tableView)
    }
    
    private func setConstraint() {
      searchBar.snp.makeConstraints {
        $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15.0)
        $0.height.equalTo(48)
        $0.left.right.equalToSuperview().inset(16.0)
      }
      
      tableView.snp.makeConstraints {
        $0.top.equalTo(searchBar.snp.bottom).offset(20)
        $0.width.equalTo(searchBar.snp.width)
        $0.bottom.equalToSuperview().inset(20.0)
        $0.centerX.equalToSuperview()
      }
      
      shadowTable.snp.makeConstraints {
        $0.edges.equalTo(tableView)
      }
    }
  }
}

import UIKit

extension SearchScene {
  
  class SearchBar : UISearchBar {
    
    lazy var backButton: UIButton = {
      let button = UIButton()
      button.setImage(R.image.chevronLeft(), for: .normal)
      button.backgroundColor = .white
      return button
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
      let spinner = UIActivityIndicatorView(style: .gray)
      spinner.backgroundColor = .white
      return spinner
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
      setupConstraints()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      backgroundImage = UIImage()
      isTranslucent = false
      showsBookmarkButton = true
      clipsToBounds = true
      layer.cornerRadius = 8.0
      layer.borderWidth = 1.0
      layer.borderColor = UIColor.lightGray.cgColor
      setImage(nil, for: .search, state: .normal)
      setImage(R.image.micro(), for: .bookmark, state: .normal)
      
      guard let textField = self.textField else { return }
      textField.backgroundColor = .white
      textField.attributedPlaceholder = NSAttributedString(
        string: "Search"
        //        attributes: [
        //          NSAttributedString.Key.foregroundColor: .blue,
        //          NSAttributedString.Key.font: .systemFont(ofSize: 14)!
        //        ]
      )
      
      guard let leftView = textField.leftView else { return }
      leftView.isUserInteractionEnabled = true
      leftView.addSubview(backButton)
      leftView.addSubview(spinner)
    }
    
    private func setupConstraints() {
      guard textField?.leftView != nil else { return }
      
      spinner.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      
      backButton.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}

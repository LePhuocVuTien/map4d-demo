import UIKit
import RxSwift

extension HomeScene {
  
  class SearchBar: UIView {
    
    private lazy var contentView: UIView = {
      let view = UIView()
      view.layer.cornerRadius = 10.0
      view.layer.shadowColor = UIColor.blue.cgColor
      view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
      view.layer.shadowRadius = 3.0
      view.layer.shadowOpacity = 0.3
      view.backgroundColor = .white
      return view
    }()
    
    private lazy var searchImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = R.image.magnifyingGlass()
      return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "Search"
      textField.isUserInteractionEnabled = false
      return textField
    }()
    
    lazy var deleteTextButton: UIButton = {
      let button = UIButton()
      button.setImage(R.image.delete(), for: .normal)
      button.isHidden = true
      return button
    }()
    
    lazy var voiceButton: UIButton = {
      let button = UIButton()
      button.setImage(R.image.micro(), for: .normal)
      return button
    }()
    
    private override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
      setConstraint()
    }
    
    public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    private func setupViews() {
      addSubview(contentView)
      addSubview(searchImageView)
      addSubview(voiceButton)
      addSubview(deleteTextButton)
      addSubview(searchTextField)
    }
  }
}

extension HomeScene.SearchBar {
  
  private func setConstraint() {
    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    searchImageView.snp.makeConstraints { make in
      make.width.height.equalTo(20.0)
      make.left.equalToSuperview().offset(16.0)
      make.centerY.equalTo(contentView.snp.centerY)
    }
    
    voiceButton.snp.makeConstraints { make in
      make.width.height.equalTo(48.0)
      make.right.equalTo(contentView.snp.right).inset(0)
      make.centerY.equalTo(contentView.snp.centerY)
    }
    
    deleteTextButton.snp.makeConstraints { make in
      make.edges.equalTo(voiceButton)
    }
    
    searchTextField.snp.makeConstraints { make in
      make.centerY.equalTo(contentView.snp.centerY)
      make.height.equalTo(48.0)
      make.left.equalTo(searchImageView.snp.right).offset(10.0)
      make.right.equalTo(voiceButton.snp.left).inset(-10.0)
    }
    
  }
}

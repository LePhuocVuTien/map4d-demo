import UIKit

extension SearchScene {
  
  class Cell : UITableViewCell {
    
    lazy var icon: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      return imageView
    }()
    
    lazy var title: UILabel = {
      let label = UILabel()
      label.numberOfLines = 1
      label.font = R.font.openSansSemiBold(size: 14.0)
      label.textColor = R.color.black()
      return label
    }()
    
    lazy var address: UILabel = {
      let label = UILabel()
      label.numberOfLines = 1
      label.font = R.font.openSansRegular(size: 14.0)
      label.textColor = R.color.textSecondary()
      return label
    }()
    
    lazy var line = UIView.line()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
      setConstraints()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
      addSubview(icon)
      addSubview(title)
      addSubview(address)
      addSubview(line)
    }
    
    private func setConstraints() {
      icon.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.left.equalToSuperview().offset(16.0)
        $0.height.width.equalTo(24.0)
      }
      
      title.snp.makeConstraints {
        $0.top.equalToSuperview().offset(15.0)
        $0.left.equalTo(icon.snp.right).offset(16.0)
        $0.right.equalToSuperview().inset(8.0)
      }
      
      address.snp.makeConstraints {
        $0.top.equalTo(title.snp.bottom).offset(5)
        $0.left.equalTo(title.snp.left)
        $0.right.equalToSuperview().inset(8.0)
        $0.bottom.equalToSuperview().inset(15.0)
      }
      
      line.snp.makeConstraints {
        $0.left.equalTo(title.snp.left)
        $0.right.bottom.equalToSuperview()
        $0.height.equalTo(0.5)
      }
    }
    
    func configure(_ item: ElementData) {
      title.text = item.place.name
      address.text = item.place.address
      let image = item.place.objectId == "" ? R.image.locationBlue() : R.image.homeBlue()
      icon.image = image
    }
  }
  
}

import UIKit
import Model
import RxUIAlert

extension HomeScene {
  func alert(item: Place) {
    rx.alert(
      title: item.name,
      message: "Địa chỉ: \(item.address ?? "")",
      actions:
        [AlertAction(title: R.string.localizable.ok(), type: 0, style: .default),
         AlertAction(title: R.string.localizable.cancel(), type: 1, style: .default)])
      .asDriverOnErrorJustComplete()
      .map{ return $0.index }
      .drive(onNext: { index in
        return
      })
      .disposed(by: disposeBag)
  }
}

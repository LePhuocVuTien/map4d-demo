//
//  NewViewController.swift
//  demo
//
//  Created by Tien Le Phuoc Vu on 21/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class NewViewController: UIViewController {
  
  @IBOutlet weak var dismissButton: UIButton!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setBinding()
    
    // Do any additional setup after loading the view.
  }
  
  func setBinding() {
    dismissButton.rx.tap
      .subscribe { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
      }
      .disposed(by: disposeBag)
  }
  
  
}



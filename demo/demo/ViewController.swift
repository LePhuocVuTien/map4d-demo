//
//  ViewController.swift
//  demo
//
//  Created by Tien Le Phuoc Vu on 21/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet weak var showbutton: UIButton!
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setBinding()
    
    // Do any additional setup after loading the view.
  }
  
  func setBinding() {
    showbutton.rx.tap
      .subscribe(onNext: { [weak self] _ in
        guard let controller = UIStoryboard.init(name: "NewViewController", bundle: nil)
                .instantiateViewController(withIdentifier: "NewViewController") as? NewViewController else {
          return
        }
        self?.present(controller, animated: true, completion: nil)
      })
      .disposed(by: disposeBag)
  }


}


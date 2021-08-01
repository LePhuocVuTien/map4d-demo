import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift

final class OptionsNetwork<T: Decodable> {
  
  private let endPoint: String
  private let scheduler: ConcurrentDispatchQueueScheduler
  private let accuracy = "0"
  
  init(_ endPoint: String) {
    self.endPoint = endPoint
    self.scheduler = ConcurrentDispatchQueueScheduler(
      qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1)
    )
  }
}

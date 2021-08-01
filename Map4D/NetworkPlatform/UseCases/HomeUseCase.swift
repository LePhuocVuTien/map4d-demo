import Foundation
import Domain
import RxSwift

final class HomeUseCase: Domain.HomeUseCase {
  
  private let network: PlaceNetwork
  
  init(network: PlaceNetwork) {
    self.network = network
  }
}

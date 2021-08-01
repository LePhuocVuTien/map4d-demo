import Domain
import RxSwift

final class OptionsUseCase: Domain.OptionsUseCase {
  
  private let network: PlaceNetwork
  
  init(network: PlaceNetwork) {
    self.network = network
  }
}


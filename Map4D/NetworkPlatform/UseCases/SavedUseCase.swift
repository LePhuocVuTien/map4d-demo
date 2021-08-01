import Domain
import RxSwift

final class SavedUseCase: Domain.SavedUseCase {
  
  private let network: PlaceNetwork
  
  init(network: PlaceNetwork) {
    self.network = network
  }
}

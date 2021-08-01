import Foundation
import Domain

public final class PlaceUseCaseProvider: Domain.SearchUseCaseProvider {
  public func makePlaceUseCase() -> Domain.SearchUseCase {
    return PlaceUseCase(
      network: networkProvider.makePlaceNetwork(),
      cache: Cache<Place>(path: "allPlaces")
    )
  }
  
  private let networkProvider: NetworkProvider
  
  public init() {
    networkProvider = NetworkProvider()
  }
}

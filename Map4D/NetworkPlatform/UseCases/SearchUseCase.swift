import Foundation
import Domain
import RxSwift

final class SearchUseCase<Cache>: Domain.SearchUseCase where
  Cache: AbstractCache, Cache.T == Place {
  
  private let network: PlaceNetwork
  private let cache: Cache
  
  init(network: PlaceNetwork, cache: Cache) {
    self.network = network
    self.cache = cache
  }
  
  func places(text: String, location: String) -> Observable<[Place]> {
    let fetchPlaces = cache.fetchObjects().asObservable()
    let stored = network.fetchPlaces(text: text, location: location)
      .map { items -> [Place] in
        return items
      }
      .flatMap {
        return self.cache.save(objects: $0)
          .asObservable()
          .map(to: [Place].self)
          .concat(Observable.just($0))
      }
    return fetchPlaces.concat(stored)
  }
}

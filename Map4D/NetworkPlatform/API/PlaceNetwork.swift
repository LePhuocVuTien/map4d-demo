import Domain
import RxSwift

public final class PlaceNetwork {
  private let network: Network<Place>
  private let accuracy = "0"
  
  init(network: Network<Place>) {
    self.network = network
  }
  
  public func fetchPlaces(text: String, location: String?) -> Observable<[Place]> {
    var parameters: [String: Any] = [
      "text": text,
      "accuracy" :accuracy
    ]
    if let location = location {
      parameters["location"] = location
    }
    return network.getItemsBySuggest("map/autosuggest", parameters: parameters)
  }
}

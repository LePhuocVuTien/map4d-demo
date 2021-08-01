import Domain

final class NetworkProvider {
  private let apiEndpoint: String
  
  public init() {
    apiEndpoint = "https://api-app.map4d.vn"
  }
  
  public func makeSearchNetwork() -> PlaceNetwork {
    let network = Network<Place>(apiEndpoint)
    return PlaceNetwork(network: network)
  }
  
  public func makeSavedNetwork() -> PlaceNetwork {
    let network = Network<Place>(apiEndpoint)
    return PlaceNetwork(network: network)
  }
  
  public func makeHomeNetwork() -> PlaceNetwork {
    let network = Network<Place>(apiEndpoint)
    return PlaceNetwork(network: network)
  }
  
  public func makeOptionsNetwork() -> PlaceNetwork {
    let network = Network<Place>(apiEndpoint)
    return PlaceNetwork(network: network)
  }
}

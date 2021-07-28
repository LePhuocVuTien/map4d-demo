public struct Location: Codable {
  public var latitude: Double
  public var longitude: Double
  
  public init(latitude: Double,
              longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

extension Location: Equatable {
  public static func == (lhs: Location, rhs: Location) -> Bool {
    return lhs.latitude == rhs.latitude &&
      lhs.longitude == rhs.longitude
  }
}

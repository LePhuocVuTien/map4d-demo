public struct Place: Codable {
  public var id: String?
  public var name: String?
  public var objectId: String?
  public var address: String?
  
  public init(
    id: String,
    name: String?,
    objectId: String?,
    address: String?
  ){
    self.id = id
    self.name = name
    self.objectId = objectId
    self.address = address
  }
}


extension Place: Equatable {
  public static func == (lhs: Place, rhs: Place) -> Bool {
    return lhs.id == rhs.id &&
      lhs.name == rhs.name &&
      lhs.objectId == rhs.objectId &&
      lhs.address == rhs.address
  }
}

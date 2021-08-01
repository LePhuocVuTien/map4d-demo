public struct Place: Codable {
  public var uid: String
  public var id: String
  public var name: String
  public var objectId: String
  public var address: String
  
  public init(
    uid: String,
    id: String,
    name: String,
    objectId: String,
    address: String
  ){
    self.uid = uid
    self.id = id
    self.name = name
    self.objectId = objectId
    self.address = address
  }
  
  public init(
    id: String,
    name: String,
    objectId: String,
    address: String
  ){
    self.init(uid: NSUUID().uuidString, id: id, name: name, objectId: objectId, address: address)
  }
  
  private enum CodingKeys: String, CodingKey {
    case uid
    case id
    case name
    case objectId
    case address
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(String.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    objectId = (try? container.decode(String.self, forKey: .objectId)) ?? ""
    address = (try? container.decode(String.self, forKey: .address)) ?? ""
    
    if let uid = try container.decodeIfPresent(Int.self, forKey: .uid) {
      self.uid = "\(uid)"
    } else {
      uid = try container.decodeIfPresent(String.self, forKey: .uid) ?? ""
    }
  }
}

extension Place: Equatable {
  public static func == (lhs: Place, rhs: Place) -> Bool {
    return lhs.uid == rhs.uid &&
      lhs.id == rhs.id &&
      lhs.name == rhs.name &&
      lhs.objectId == rhs.objectId &&
      lhs.address == rhs.address
  }
}

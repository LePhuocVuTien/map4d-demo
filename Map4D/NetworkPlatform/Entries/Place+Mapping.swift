import Domain

extension Place: Identifiable {}

extension Place {
  func toJSON() -> [String: Any] {
    return [
      "uid": uid,
      "id": id,
      "name": name,
      "objectId": objectId,
      "address": address
    ]
  }
}

extension Place: Encodable {
  var encoder: NETPlace {
    return NETPlace(with: self)
  }
}

final class NETPlace: NSObject, NSCoding, DomainConvertibleType {
  struct Keys {
    static let uid = "uid"
    static let id = "id"
    static let name = "name"
    static let objectId = "objectId"
    static let address = "address"
  }
  let uid: String
  let id: String
  let name: String
  let objectId: String
  let address: String
  
  init(with domain: Place) {
    self.uid = domain.uid
    self.id = domain.id
    self.name = domain.name
    self.objectId = domain.objectId
    self.address = domain.address
  }
  
  init?(coder aDecoder: NSCoder) {
    guard
      let uid = aDecoder.decodeObject(forKey: Keys.uid) as? String,
      let id = aDecoder.decodeObject(forKey: Keys.id) as? String,
      let name = aDecoder.decodeObject(forKey: Keys.name) as? String,
      let objectId = aDecoder.decodeObject(forKey: Keys.objectId) as? String,
      let address = aDecoder.decodeObject(forKey: Keys.address) as? String
      else {
        return nil
      }
    self.uid = uid
    self.id = id
    self.name = name
    self.objectId = objectId
    self.address = address
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(uid, forKey: Keys.uid)
    aCoder.encode(id, forKey: Keys.id)
    aCoder.encode(name, forKey: Keys.name)
    aCoder.encode(objectId, forKey: Keys.objectId)
    aCoder.encode(address, forKey: Keys.address)
  }
  
  func asDomain() -> Place {
    return Place(
      uid: uid,
      id: id,
      name: name,
      objectId: objectId,
      address: address)
  }
}

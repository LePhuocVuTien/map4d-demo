public struct Response<T: Decodable>: Decodable {
  public let code: String
  public var message: String
  public var result: T
  
  public enum CodingKeys: String, CodingKey {
    case code
    case message
    case result
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    code = try values.decode(String.self, forKey: .code)
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    if code != "ok" {
      throw Error.exception(code, message)
    }
    result = try values.decode(T.self, forKey: .result)
  }
}

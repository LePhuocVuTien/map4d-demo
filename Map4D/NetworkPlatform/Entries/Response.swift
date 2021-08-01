import Domain

public struct Response<T: Decodable>: Decodable {
  let code: String
  var message: String
  var result: T

  enum CodingKeys: String, CodingKey {
    case code
    case message
    case result
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    code = try container.decode(String.self, forKey: .code)
    message = (try? container.decode(String.self, forKey: .message)) ?? ""
//    if code != "ok" {
//      throw NSError()
//    }
    result = try container.decode(T.self, forKey: .result)
  }
}

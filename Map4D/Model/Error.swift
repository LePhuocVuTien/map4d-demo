  public enum Error: Swift.Error {
  case http(Int, String)
  case invalidResponse(String)
  case exception(String, String)
}

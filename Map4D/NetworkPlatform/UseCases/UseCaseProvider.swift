import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
  public func makeScenesUseCase() -> Domain.ScenesUseCase {
    return ScenesUseCase(
      network: networkProvider.makePostsNetwork(),
      cache: Cache<Post>(path: "allPosts")
    )
  }
  
  private let networkProvider: NetworkProvider
  
  public init() {
    networkProvider = NetworkProvider()
  }
}

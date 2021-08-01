import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
  private let networkProvider: NetworkProvider
  
  public init() {
    networkProvider = NetworkProvider()
  }
  
  public func makeHomeUseCase() -> Domain.HomeUseCase {
    return HomeUseCase(network: networkProvider.makeHomeNetwork())
  }
  
  public func makeSavedUseCase() -> Domain.SavedUseCase {
    return SavedUseCase(network: networkProvider.makeSavedNetwork())
  }
  
  public func makeOptionsUseCase() -> Domain.OptionsUseCase {
    return OptionsUseCase(network: networkProvider.makeOptionsNetwork())
  }
  
  public func makeSearchUseCase() -> Domain.SearchUseCase {
    return SearchUseCase(
      network: networkProvider.makeSearchNetwork(),
      cache: Cache<Place>(path: "allPosts"))
  }
  
  //    public func makePostsUseCase() -> Domain.PostsUseCase {
  //        return PostsUseCase(network: networkProvider.makePostsNetwork(),
  //                               cache: Cache<Post>(path: "allPosts"))
  //    }
}

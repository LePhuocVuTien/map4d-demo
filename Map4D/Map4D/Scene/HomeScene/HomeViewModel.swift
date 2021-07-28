import Domain
import RxSwift
import RxCocoa

final class HomeViewModel: ViewModelType {
  
  struct Input {
//    let trigger: Driver<Void>
    //    let createPostTrigger: Driver<Void>
  }
  struct Output {
    //    let fetching: Driver<Bool>
    //    let createSearch: Driver<Void>
    //    let error: Driver<Error>
  }
  
  private let useCase: ScenesUseCase
  private let navigator: HomeNavigator
  
  init(useCase: ScenesUseCase, navigator: HomeNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  
  }
  
  func transform(input: Input) -> Output {
//    let activityIndicator = ActivityIndicator()
//    let errorTracker = ErrorTracker()
   
    return Output()
  }
}

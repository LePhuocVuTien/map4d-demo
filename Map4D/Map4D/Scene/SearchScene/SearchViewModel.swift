import Domain
import RxSwift
import RxCocoa

final class SearchViewModel: ViewModelType {
  
  struct Input {
    let trigger: Driver<Void>
  }
  
  struct Output {
    //    let fetching: Driver<Bool>
    //    let createSearch: Driver<Void>
    //    let error: Driver<Error>
  }
  
  private let useCase: ScenesUseCase
  private let navigator: SearchNavigator
  
  init(useCase: ScenesUseCase, navigator: SearchNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  
  }
  
  func transform(input: Input) -> Output {
//    let activityIndicator = ActivityIndicator()
//    let errorTracker = ErrorTracker()
   
    return Output()
  }
}

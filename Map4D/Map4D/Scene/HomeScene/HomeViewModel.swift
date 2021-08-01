import Domain
import RxSwift
import RxCocoa

final class HomeViewModel: ViewModelType {
  
  struct Input {
    let trigger: Driver<Void>
    let searchTriger: Driver<Void>
  }
  struct Output {
    //    let fetching: Driver<Bool>
    let searchResult: Driver<Void>
    //    let error: Driver<Error>
  }
  
  private let useCase: HomeUseCase
  private let navigator: HomeNavigator
  
  init(useCase: HomeUseCase, navigator: HomeNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  
  }
  
  func transform(input: Input) -> Output {
//    let activityIndicator = ActivityIndicator()
//    let errorTracker = ErrorTracker()
    
    let searchResult = input.searchTriger
      .do(onNext: navigator.toSearch)
    
    return Output(searchResult: searchResult)
  }
}

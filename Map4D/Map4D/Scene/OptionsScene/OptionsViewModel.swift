import Domain
import RxSwift
import RxCocoa

final class OptionsViewModel: ViewModelType {
  
  struct Input {
    let trigger: Driver<Void>
  }
  
  struct Output {
    //    let fetching: Driver<Bool>
    //    let error: Driver<Error>
  }
  
  private let useCase: ScenesUseCase
  private let navigator: OptionsNavigator
  
  init(useCase: ScenesUseCase, navigator: OptionsNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  
  }
  
  func transform(input: Input) -> Output {
//    let activityIndicator = ActivityIndicator()
//    let errorTracker = ErrorTracker()
   
    return Output()
  }
}

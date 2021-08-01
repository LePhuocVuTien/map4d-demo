import Domain
import RxSwift
import RxCocoa

final class SavedViewModel: ViewModelType {
  
  struct Input {
    let trigger: Driver<Void>
  }
  
  struct Output {
    //    let fetching: Driver<Bool>
    //    let result: Driver<Void>
    //    let error: Driver<Error>
  }
  
  private let useCase: Domain.SavedUseCase
  private let navigator: SavedNavigator
  
  init(useCase: Domain.SavedUseCase, navigator: SavedNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  
  }
  
  func transform(input: Input) -> Output {
//    let activityIndicator = ActivityIndicator()
//    let errorTracker = ErrorTracker()
   
    return Output()
  }
}

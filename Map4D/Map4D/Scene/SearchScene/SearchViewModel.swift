import Domain
import RxSwift
import RxCocoa
import RxDataSources

final class SearchViewModel: ViewModelType {
  
  private var location = "16.0723134, 108.2243242"
  
  struct Input {
    let textTrigger: Driver<String>
  }
  
  struct Output {
    let fetching: Driver<Bool>
    let createSearch: Driver<[SectionModel<String, Element>]>
    let error: Driver<Error>
  }
  
  private let useCase: SearchUseCase
  private let navigator: SearchNavigator
  
  init(useCase: SearchUseCase, navigator: SearchNavigator) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    
    let result = input.textTrigger
      .flatMapLatest({ text -> Driver<[SectionModel<String, Element>]> in
        if text.isEmpty {
          return Driver.of([])
        }
        return self.useCase.places(text: text, location: self.location)
          .trackActivity(activityIndicator)
          .trackError(errorTracker)
          .asDriverOnErrorJustComplete()
          .map { places -> [SectionModel<String, Element>] in
            return [SectionModel(model: "", items: places.map {Element(place: $0)})]
          }
      })
    
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    return Output(fetching: fetching, createSearch: result, error: errors)
  }
}

extension SearchViewModel {
  enum TypeElement{
    case normal
    case label
  }
  
  struct Element {
    var type: TypeElement = .normal
    var place: Domain.Place
  }
}

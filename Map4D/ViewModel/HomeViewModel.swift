import UIKit
import Model
import RxSwift
import RxCocoa
import RxAlamofire

public class HomeViewModel: ViewModel {
  
  public init() {
  }
  
  public func transform(input: Input) -> Output {
    
    let errorTracker = ErrorTracker()
    let activityIndicator = ActivityIndicator()
    
    let result = input.nameTriger
      .flatMapLatest({ [weak self] id -> Driver<Model.Place> in
        guard let self = self else { return .empty() }
        return self.fetchItem(id: id)
          .trackActivity(activityIndicator)
          .trackError(errorTracker)
          .asDriverOnErrorJustComplete()
      })
      .map { [unowned self] place -> Element in
        return self.makeElement(place: place)
      }
      .asDriver()
    
    return Output(result: result)
  }
  
  private func makeElement(place: Place) -> Element {
    return Element(place: place)
  }
  
  private func fetchItem(id: String) -> Observable<Place> {
    let url = "https://api-app.map4d.vn/map/place/detail/\(id)"
    return requestJSON(.get, url)
      .flatMapLatest { [weak self] _, json -> Observable<Place> in
        guard let data =  try? JSONSerialization.data(withJSONObject: json) else {
          return . empty()
        }
        do {
          let respose = try self?.jsonDecoder.decode(Response<Place>.self, from: data)
          return Observable.of(respose!.result)
        } catch { error
          print(error)
          return .empty()
        }
      }
  }
  
  private var jsonDecoder: JSONDecoder {
    get {
      let jsonDecoder = JSONDecoder()
      jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
      jsonDecoder.dateDecodingStrategy = .secondsSince1970
      return jsonDecoder
    }
  }
}

extension HomeViewModel {
  public struct Input {
    public var nameTriger: Driver<String>
    
    public init(idTriger: Driver<String>) {
      self.nameTriger = idTriger
    }
  }
  
  public struct Output {
    public var result: Driver<Element> 
  }
  
  public struct Element {
    public var place: Place
  }
}

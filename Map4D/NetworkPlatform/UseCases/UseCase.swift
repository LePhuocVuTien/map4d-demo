import Domain
import RxSwift

struct MapFromNever: Error {}
extension ObservableType where Element == Never {
  func map<T>(to: T.Type) -> Observable<T> {
    return self.flatMap { _ in
      return Observable<T>.error(MapFromNever())
    }
  }
}

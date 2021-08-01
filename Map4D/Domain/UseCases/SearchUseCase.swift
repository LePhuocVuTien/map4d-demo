import RxSwift

public protocol SearchUseCase {
  func places(text: String, location: String) -> Observable<[Place]>
}

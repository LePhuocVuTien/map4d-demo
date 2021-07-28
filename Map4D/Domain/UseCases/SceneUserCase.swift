import RxSwift

public protocol ScenesUseCase {
    func scenes() -> Observable<[Post]>
}

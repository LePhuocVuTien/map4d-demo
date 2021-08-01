public protocol UseCaseProvider {
  func makeHomeUseCase() -> HomeUseCase
  func makeSavedUseCase() -> SavedUseCase
  func makeOptionsUseCase() -> OptionsUseCase
  func makeSearchUseCase() -> SearchUseCase
}

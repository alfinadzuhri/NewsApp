class SourcesInteractor: SourcesInteractorProtocol {
    var presenter: SourcesInteractorOutputProtocol?

    func fetchSources(for category: Category) {
        APIClient.shared.fetchSources(for: category.category) { result in
            switch result {
            case .success(let sources):
                self.presenter?.sourcesFetched(sources)
            case .failure(let error):
                self.presenter?.sourcesFetchFailed(error)
            }
        }
    }

    func searchSources(query: String) {
        //
    }
}

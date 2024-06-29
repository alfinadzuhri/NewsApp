class SourcesPresenter: SourcesPresenterProtocol {
    weak var view: SourcesViewProtocol?
    var interactor: SourcesInteractorProtocol?
    var router: SourcesRouterProtocol?
    private var category: Category

    init(category: Category) {
        self.category = category
    }

    func viewDidLoad() {
        interactor?.fetchSources(for: category)
    }

    func didSelectSource(_ source: Source) {
        router?.navigateToArticles(for: source)
    }

    func searchSources(query: String) {
        interactor?.searchSources(query: query)
    }
}

extension SourcesPresenter: SourcesInteractorOutputProtocol {
    func sourcesFetched(_ sources: [Source]) {
       /* print("Fetched \(sources.count) sources") */ // Debug print
        view?.showSources(sources)
    }

    func sourcesFetchFailed(_ error: Error) {
       /* print("Failed to fetch sources: \(error.localizedDescription)")*/  // Debug print
        view?.showError(error)
    }
}

class ArticlesInteractor: ArticlesInteractorProtocol {
    var presenter: ArticlesInteractorOutputProtocol?

    func fetchArticles(for source: Source) {
        APIClient.shared.fetchArticles(for: source.id) { result in
            switch result {
            case .success(let articles):
                self.presenter?.articlesFetched(articles)
            case .failure(let error):
                self.presenter?.articlesFetchFailed(error)
            }
        }
    }

    func searchArticles(query: String) {
        //
    }
}

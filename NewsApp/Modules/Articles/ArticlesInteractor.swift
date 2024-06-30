class ArticlesInteractor: ArticlesInteractorProtocol {
    var presenter: ArticlesInteractorOutputProtocol?
    private var allArticles: [Article] = []

    func fetchArticles(for source: Source) {
        APIClient.shared.fetchArticles(for: source.id) { result in
            switch result {
            case .success(let articles):
                self.allArticles = articles
                self.presenter?.articlesFetched(articles)
            case .failure(let error):
                self.presenter?.articlesFetchFailed(error)
            }
        }
    }

    func searchArticles(query: String) {
        let filteredArticles = allArticles.filter { article in
            article.title.lowercased().contains(query.lowercased())
        }
        self.presenter?.articlesFetched(filteredArticles)
    }
}

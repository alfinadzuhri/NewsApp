class ArticlesPresenter: ArticlesPresenterProtocol {
    weak var view: ArticlesViewProtocol?
    var interactor: ArticlesInteractorProtocol?
    var router: ArticlesRouterProtocol?
    private var source: Source

    init(source: Source) {
        self.source = source
    }

    func viewDidLoad() {
        interactor?.fetchArticles(for: source)
    }

    func didSelectArticle(_ article: Article) {
        router?.navigateToArticleDetail(for: article)
    }

    func searchArticles(query: String) {
        interactor?.searchArticles(query: query)
    }
}

extension ArticlesPresenter: ArticlesInteractorOutputProtocol {
    func articlesFetched(_ articles: [Article]) {
        view?.showArticles(articles)
    }

    func articlesFetchFailed(_ error: Error) {
        view?.showError(error)
    }
}

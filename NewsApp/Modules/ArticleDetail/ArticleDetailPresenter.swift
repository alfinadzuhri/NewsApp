class ArticleDetailPresenter: ArticleDetailPresenterProtocol {
    weak var view: ArticleDetailViewProtocol?
    private var article: Article

    init(article: Article) {
        self.article = article
    }

    func viewDidLoad() {
        view?.showArticle(article)
    }
}

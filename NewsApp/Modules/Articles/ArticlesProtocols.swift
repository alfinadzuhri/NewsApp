import Foundation

protocol ArticlesViewProtocol: AnyObject {
    func showArticles(_ articles: [Article])
    func showError(_ error: Error)
}

protocol ArticlesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectArticle(_ article: Article)
    func searchArticles(query: String)
}

protocol ArticlesInteractorProtocol: AnyObject {
    func fetchArticles(for source: Source)
    func searchArticles(query: String)
}

protocol ArticlesInteractorOutputProtocol: AnyObject {
    func articlesFetched(_ articles: [Article])
    func articlesFetchFailed(_ error: Error)
}

protocol ArticlesRouterProtocol: AnyObject {
    func navigateToArticleDetail(for article: Article)
}


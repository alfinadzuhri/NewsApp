import Foundation

protocol ArticleDetailViewProtocol: AnyObject {
    func showArticle(_ article: Article)
}

protocol ArticleDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol ArticleDetailInteractorProtocol: AnyObject {
}

protocol ArticleDetailRouterProtocol: AnyObject {
}

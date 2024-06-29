import UIKit

class ArticlesRouter: ArticlesRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToArticleDetail(for article: Article) {
        let articleDetailVC = ArticleDetailRouter.createModule(article: article)
        viewController?.navigationController?.pushViewController(articleDetailVC, animated: true)
    }

    static func createModule(source: Source) -> UIViewController {
        let view = ArticlesView()
        let presenter = ArticlesPresenter(source: source)
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

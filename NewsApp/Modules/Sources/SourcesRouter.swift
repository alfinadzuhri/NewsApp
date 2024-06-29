import UIKit

class SourcesRouter: SourcesRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToArticles(for source: Source) {
        let articlesVC = ArticlesRouter.createModule(source: source)
        viewController?.navigationController?.pushViewController(articlesVC, animated: true)
    }

    static func createModule(category: Category) -> UIViewController {
        let view = SourcesView()
        let presenter = SourcesPresenter(category: category)
        let interactor = SourcesInteractor()
        let router = SourcesRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

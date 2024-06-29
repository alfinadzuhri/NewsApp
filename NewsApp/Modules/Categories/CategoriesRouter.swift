import UIKit

class CategoriesRouter: CategoriesRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToSources(for category: Category) {
        let sourcesVC = SourcesRouter.createModule(category: category)
        viewController?.navigationController?.pushViewController(sourcesVC, animated: true)
    }

    static func createModule() -> UIViewController {
        let view = CategoriesView()
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor()
        let router = CategoriesRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

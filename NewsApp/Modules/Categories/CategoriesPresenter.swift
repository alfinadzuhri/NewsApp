import Foundation

class CategoriesPresenter: CategoriesPresenterProtocol {
    weak var view: CategoriesViewProtocol?
    var interactor: CategoriesInteractorProtocol?
    var router: CategoriesRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchCategories()
    }

    func didSelectCategory(_ category: Category) {
        router?.navigateToSources(for: category)
    }
}

extension CategoriesPresenter: CategoriesInteractorOutputProtocol {
    func categoriesFetched(_ categories: [Category]) {
        let uniqueCategories = Array(Set(categories.map { $0.category })).map { category in
            categories.first { $0.category == category }!
        }
        view?.showCategories(uniqueCategories)
    }

    func categoriesFetchFailed(_ error: Error) {
        view?.showError(error)
    }
}

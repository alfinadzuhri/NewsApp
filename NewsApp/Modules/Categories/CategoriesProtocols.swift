import Foundation

protocol CategoriesViewProtocol: AnyObject {
    func showCategories(_ categories: [Category])
    func showError(_ error: Error)
}

protocol CategoriesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectCategory(_ category: Category)
}

protocol CategoriesInteractorProtocol: AnyObject {
    func fetchCategories()
}

protocol CategoriesInteractorOutputProtocol: AnyObject {
    func categoriesFetched(_ categories: [Category])
    func categoriesFetchFailed(_ error: Error)
}

protocol CategoriesRouterProtocol: AnyObject {
    func navigateToSources(for category: Category)
}

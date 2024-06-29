import Foundation

class CategoriesInteractor: CategoriesInteractorProtocol {
    var presenter: CategoriesInteractorOutputProtocol?

    func fetchCategories() {
        APIClient.shared.fetchCategories { result in
            switch result {
            case .success(let categories):
                self.presenter?.categoriesFetched(categories)
            case .failure(let error):
                self.presenter?.categoriesFetchFailed(error)
            }
        }
    }
}

import Foundation

class SourcesInteractor: SourcesInteractorProtocol {
    var presenter: SourcesInteractorOutputProtocol?
    private var allSources: [Source] = []

    func fetchSources(for category: Category) {
       /* print("Fetching sources for category: \(category.category)")*/  // Debug print
        APIClient.shared.fetchSources(for: category.category) { result in
            switch result {
            case .success(let sources):
               /* print("Fetched sources: \(sources)")*/  // Debug print
                self.allSources = sources
                self.presenter?.sourcesFetched(sources)
            case .failure(let error):
                /*print("Failed to fetch sources: \(error.localizedDescription)") */ // Debug print
                self.presenter?.sourcesFetchFailed(error)
            }
        }
    }

    func searchSources(query: String) {
       /* print("Searching sources with query: \(query)")*/  // Debug print
        if query.isEmpty {
            presenter?.sourcesFetched(allSources)
        } else {
            let filteredSources = allSources.filter { $0.name.lowercased().contains(query.lowercased()) }
            presenter?.sourcesFetched(filteredSources)
        }
    }
}

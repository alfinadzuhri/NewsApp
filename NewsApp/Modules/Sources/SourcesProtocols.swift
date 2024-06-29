import Foundation

protocol SourcesViewProtocol: AnyObject {
    func showSources(_ sources: [Source])
    func showError(_ error: Error)
}

protocol SourcesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectSource(_ source: Source)
    func searchSources(query: String)
}

protocol SourcesInteractorProtocol: AnyObject {
    func fetchSources(for category: Category)
    func searchSources(query: String)
}

protocol SourcesInteractorOutputProtocol: AnyObject {
    func sourcesFetched(_ sources: [Source])
    func sourcesFetchFailed(_ error: Error)
}

protocol SourcesRouterProtocol: AnyObject {
    func navigateToArticles(for source: Source)
}

import UIKit

class SourcesView: UIViewController, SourcesViewProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var presenter: SourcesPresenterProtocol!
    private var sources: [Source] = []
    private let tableView = UITableView()
    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "Sources"
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "Search sources"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SourceCell")
    }

    func showSources(_ sources: [Source]) {
        self.sources = sources
        DispatchQueue.main.async {
           /* print("Reloading table view with \(sources.count) sources")*/  // Debug print
            self.tableView.reloadData()
        }
    }

    func showError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath)
        cell.textLabel?.text = sources[indexPath.row].name
       /* print("Displaying source: \(sources[indexPath.row].name)")*/  // Debug print
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectSource(sources[indexPath.row])
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /*print("Search text: \(searchText)")*/  // Debug print
        presenter.searchSources(query: searchText)
    }
}

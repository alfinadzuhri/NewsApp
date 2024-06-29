import UIKit

class ArticlesView: UIViewController, ArticlesViewProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var presenter: ArticlesPresenterProtocol!
    private var articles: [Article] = []
    private let tableView = UITableView()
    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "Articles"
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "Search articles"
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ArticleCell")
    }

    func showArticles(_ articles: [Article]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError(_ error: Error) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectArticle(articles[indexPath.row])
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchArticles(query: searchText)
    }
}

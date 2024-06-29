import UIKit
import WebKit

class ArticleDetailView: UIViewController, ArticleDetailViewProtocol {
    var presenter: ArticleDetailPresenterProtocol!
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        webView = WKWebView()
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func showArticle(_ article: Article) {
        if let url = URL(string: article.url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

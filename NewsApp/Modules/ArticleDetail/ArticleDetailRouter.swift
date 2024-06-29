import UIKit

class ArticleDetailRouter {
    static func createModule(article: Article) -> UIViewController {
        let view = ArticleDetailView()
        let presenter = ArticleDetailPresenter(article: article)

        view.presenter = presenter
        presenter.view = view

        return view
    }
}

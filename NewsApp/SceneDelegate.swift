import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let categoriesVC = CategoriesRouter.createModule()
        let navigationController = UINavigationController(rootViewController: categoriesVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

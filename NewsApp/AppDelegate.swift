import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let categoriesVC = CategoriesRouter.createModule()
        let navigationController = UINavigationController(rootViewController: categoriesVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

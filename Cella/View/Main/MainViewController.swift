
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
//        do {
//          try Auth.auth().signOut()
//        } catch let signOutError as NSError {
//          print("Error signing out: %@", signOutError)
//        }
        drawUI()
    }
    
    func drawUI() {
        view.backgroundColor = .white
        let searchVC = SearchViewController()
        let warehouseVC = WarehouseViewController()
        let addProductVC = AddProductViewController()
        let analyzeVC = AnalyzeViewController()
        let profileVC = ProfileViewController()
        searchVC.tabBarItem.image = UIImage(named: "search")
        warehouseVC.tabBarItem.image = UIImage(named: "warehouse")
        addProductVC.tabBarItem.image = UIImage(named: "addProduct")
        analyzeVC.tabBarItem.image = UIImage(named: "analyze")
        profileVC.tabBarItem.image = UIImage(named: "profile")
        setViewControllers([searchVC, warehouseVC, addProductVC, analyzeVC, profileVC], animated: false)
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = Color().hex("#C8C8C8").cgColor
        tabBar.tintColor = Color().hex("#FFC107")
        
    }
    
//    func navigate(viewController: UIViewController, animate: Bool){
//        navigationViewController!.setViewControllers([viewController], animated: animate)
//        view.addSubview(navigationViewController!.view)
//        addChild(navigationViewController!)
//        navigationViewController!.didMove(toParent: self)
//    }
}

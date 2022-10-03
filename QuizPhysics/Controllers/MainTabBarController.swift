
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let abstractViewController = createNavController(vc: AbstractTableViewController(), itemName: "Конспекты", itemImage: "scribble.variable")
        let videoLessViewController = createNavController(vc: VideoLessCollectionViewController(), itemName: "ВидеоУроки", itemImage: "play.rectangle")
        let quizViewController = createNavController(vc: QuizTableViewController(), itemName: "Тесты", itemImage: "circle.grid.cross.fill")
        
        viewControllers = [abstractViewController, videoLessViewController, quizViewController]
    }
    
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: 0, right: 0)), tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item

        return navController
    }
}



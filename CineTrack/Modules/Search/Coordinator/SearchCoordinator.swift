import UIKit

final class SearchCoordinator: Coordinator {

    let navigationController: UINavigationController

    init() {
        let searchViewController = SearchViewController()
        navigationController = UINavigationController(rootViewController: searchViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            tag: 1
        )
    }
}

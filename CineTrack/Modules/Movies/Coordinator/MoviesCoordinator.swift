import UIKit

final class MoviesCoordinator: Coordinator {
    let navigationController: UINavigationController

    init() {
        let moviesViewController = MoviesViewController()
        navigationController = UINavigationController(rootViewController: moviesViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: "Movies",
            image: UIImage(systemName: "film"),
            tag: 0
        )
    }
}

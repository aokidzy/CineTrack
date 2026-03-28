import UIKit

final class WatchlistCoordinator: Coordinator {

    let navigationController: UINavigationController

    init() {
        let watchlistViewController = WatchlistViewController()
        navigationController = UINavigationController(rootViewController: watchlistViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: "Watchlist",
            image: UIImage(systemName: "bookmark"),
            tag: 2
        )
    }
}

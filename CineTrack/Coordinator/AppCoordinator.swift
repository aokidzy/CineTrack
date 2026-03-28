import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
}

final class AppCoordinator {
    private weak var window: UIWindow?
    private let coordinatorFactory: CoordinatorFactoryProtocol

    private lazy var moviesCoordinator = coordinatorFactory.makeMoviesCoordinator()
    private lazy var searchCoordinator = coordinatorFactory.makeSearchCoordinator()
    private lazy var watchlistCoordinator = coordinatorFactory.makeWatchlistCoordinator()

    init(window: UIWindow, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        setupTabBar()
    }

    private func setupTabBar() {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            moviesCoordinator.navigationController,
            searchCoordinator.navigationController,
            watchlistCoordinator.navigationController
        ]
        window?.rootViewController = tabBarController
    }
}

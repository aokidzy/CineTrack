import UIKit

protocol CoordinatorFactoryProtocol {
    func makeMoviesCoordinator() -> any Coordinator
    func makeSearchCoordinator() -> any Coordinator
    func makeWatchlistCoordinator() -> any Coordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeMoviesCoordinator() -> any Coordinator {
        return MoviesCoordinator()
    }

    func makeSearchCoordinator() -> any Coordinator {
        return SearchCoordinator()
    }

    func makeWatchlistCoordinator() -> any Coordinator {
        return WatchlistCoordinator()
    }
}

protocol FetchPopularMoviesListUseCaseProtocol
{
    func execute() async throws -> [Movie]
}

final class FetchPopularMoviesListUseCase
{
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
}

extension FetchPopularMoviesListUseCase: FetchPopularMoviesListUseCaseProtocol
{
    func execute() async throws -> [Movie] {
        try await self.moviesRepository.fetchPopularMoviesList()
    }
}

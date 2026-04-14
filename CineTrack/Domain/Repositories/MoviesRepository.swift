import Foundation

protocol MoviesRepository: AnyObject
{
    func fetchPopularMoviesList() async throws -> [Movie]
}

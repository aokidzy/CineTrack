import UIKit

final class MoviesViewController: UIViewController
{
    private let moviesView = MoviesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = moviesView
        title = "Movies"
        moviesView.setDataSource(self)
    }
}

// MARK: - UICollectionViewDataSource

extension MoviesViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCellView.movieCellIdentifier, for: indexPath)
        return movieCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoviesSectionHeaderView.headerIdentifier, for: indexPath) as? MoviesSectionHeaderView else {
                return UICollectionReusableView()
            }
            header.titleLabel.text = "TOP"
            return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
}

import UIKit

final class MoviesView: UIView
{
    private lazy var moviesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCellView.self,
                                forCellWithReuseIdentifier: MovieCellView.movieCellIdentifier)
        collectionView.register(MoviesSectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MoviesSectionHeaderView.headerIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) { nil }
}

// MARK: - Setup UI and Constraints

private extension MoviesView
{
    func setupUI() {
        addSubview(moviesCollectionView)
    }

    func setupConstraints() {
        moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            moviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

//MARK: - UICollectionView

extension MoviesView
{
    func setDataSource(_ dataSource: UICollectionViewDataSource) {
        moviesCollectionView.dataSource = dataSource
    }

    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                   heightDimension: .fractionalHeight(0.3))
            let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.05))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                                            alignment: .top)
                                                                            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: "background")
            sectionBackground.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 0, bottom: 70, trailing: 0)

            section.boundarySupplementaryItems = [sectionHeader]
            section.decorationItems = [sectionBackground]
            return section
        }
        layout.register(MoviesSectionBackgroundView.self, forDecorationViewOfKind: "background")
        return layout
    }
}

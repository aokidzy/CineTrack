import UIKit

final class MoviesSectionBackgroundView: UICollectionReusableView
{
    static let backgroundIdentifier = "sectionBackground"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) { nil }
}

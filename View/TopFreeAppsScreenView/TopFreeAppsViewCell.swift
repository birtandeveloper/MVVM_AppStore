import UIKit

class TopFreeAppsViewCell: UICollectionViewCell {
    
    let image = UIImageView(backgroundColor: .black, cornerRadius: Constants.Dimensions.maxCornerRadius, width: Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    let appTitle = UILabel(text: Constants.Text.appTitleText, font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    let appArtistTitle = UILabel(text: Constants.Text.appDetailsText, font: .systemFont(ofSize: Constants.Text.minTextSize))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = VerticalStackView(arrangedSubviews: [image, appTitle, appArtistTitle])
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding: .init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.maxPadding, right: Constants.Dimensions.maxPadding))
    }    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

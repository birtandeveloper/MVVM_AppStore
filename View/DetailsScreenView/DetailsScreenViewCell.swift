//
//  DetailsScreenViewCell.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit

class DetailsScreenViewCell: UICollectionViewCell {
    var appDetailsResult: Results! {
        didSet {
            detailsTitle.text = appDetailsResult?.trackName
            detailsDescription.text = appDetailsResult?.releaseNotes
            detailsImage.sd_setImage(with: URL(string: appDetailsResult?.artworkUrl100 ?? ""))
            priceButton.setTitle(appDetailsResult?.formattedPrice, for: .normal)
        }
    }
    
    let detailsImage = UIImageView(backgroundColor: .black, cornerRadius: Constants.Dimensions.maxCornerRadius, width: Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    let detailsTitle = UILabel(text: Constants.Text.appTitleText, font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    let detailsDescription = UILabel(text: Constants.Text.appDetailsText, font: .systemFont(ofSize: Constants.Text.minTextSize))
    let priceButton =  UIButton(title: Constants.Text.appPriceText)
    let whatsNewLabel = UILabel(text: Constants.Text.whatsnewText, font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                detailsImage,VerticalStackView(arrangedSubviews: [
                    detailsTitle,
                    UIStackView(arrangedSubviews: [priceButton, UIView()])],spacing: Constants.Dimensions.minSpacing)],customSpacing: Constants.Dimensions.maxSpacing),
            whatsNewLabel, detailsDescription
        ], spacing: Constants.Dimensions.maxSpacing)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.maxPadding, right: Constants.Dimensions.maxPadding))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  TopPaidAppsViewCell.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 16.03.2023.
//

import UIKit

class TopPaidAppsViewCell: UICollectionViewCell {
    
    let image = UIImageView(backgroundColor: .black, cornerRadius: Constants.Dimensions.maxCornerRadius, width: Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    let appTitle = UILabel(text: Constants.Text.appTitleText, font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    let appDescription = UILabel(text: Constants.Text.appDetailsText, font: .boldSystemFont(ofSize: Constants.Text.minTextSize))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = VerticalStackView(arrangedSubviews: [image, appTitle, appDescription])
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding: .init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.maxPadding, right: Constants.Dimensions.maxPadding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

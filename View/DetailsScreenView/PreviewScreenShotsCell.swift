//
//  ScreenShotsCell.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 1.02.2023.
//

import UIKit

class PreviewScreenShotsCell: UICollectionViewCell {
    
    var horizontalViewController = PreviewScreenShotsVC()
    let previewLabel = UILabel(text: Constants.Text.previewText, font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewLabel)
        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: Constants.Dimensions.zeroPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.zeroPadding, right: Constants.Dimensions.maxPadding))
        
        addSubview(horizontalViewController.view)
        horizontalViewController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.zeroPadding, bottom: Constants.Dimensions.zeroPadding, right: Constants.Dimensions.maxPadding))
        
    }    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

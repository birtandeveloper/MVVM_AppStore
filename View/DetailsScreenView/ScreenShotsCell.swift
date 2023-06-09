//
//  ScreenShotsCell.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 1.02.2023.
//

import UIKit

class ScreenShotsCell: UICollectionViewCell {
    
    let imageView = UIImageView(backgroundColor: .black, cornerRadius: Constants.Dimensions.maxCornerRadius, width: Constants.Dimensions.screenShotsWidth, height: Constants.Dimensions.screenShotsHeight)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

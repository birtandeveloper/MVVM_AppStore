//
//  Ext + UIImage.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 22.01.2023.
//

import UIKit

extension UIImageView {
    convenience init(backgroundColor: UIColor, cornerRadius: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(image: nil)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.constrainHeight(constant: height)
        self.constrainWidth(constant: width)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

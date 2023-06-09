//
//  Ext + UIStackView.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 31.01.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}

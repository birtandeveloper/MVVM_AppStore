//
//  Ext + UIButton.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 31.01.2023.
//

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(frame: .zero)
        self.titleLabel?.text = title
        self.backgroundColor = .blue
        self.layer.cornerRadius = 32/2
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.setTitleColor(.white, for: .normal)
        self.constrainHeight(constant: 32)
        self.constrainWidth(constant: 80)
    }
}

//
//  Ext + UILabel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 22.01.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

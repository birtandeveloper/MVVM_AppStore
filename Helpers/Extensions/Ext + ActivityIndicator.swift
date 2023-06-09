//
//  Ext + ActivityIndicator.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 9.06.2023.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    convenience init(color: UIColor, style: UIActivityIndicatorView.Style = .large) {
        self.init(frame: .zero)
        self.color = color
        self.hidesWhenStopped = true
    }
}

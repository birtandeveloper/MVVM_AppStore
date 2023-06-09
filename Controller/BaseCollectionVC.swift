//
//  BaseCollectionVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 22.01.2023.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

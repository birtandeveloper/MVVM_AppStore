//
//  ScreenShotsVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 1.02.2023.
//

import UIKit

class PreviewScreenShotsVC: HorizontalSlidingController, UICollectionViewDelegateFlowLayout {
    
    var appResults: Results? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ScreenShotsCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.ScreenShotsId)
        collectionView.contentInset = .init(top: Constants.Dimensions.zeroPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.zeroPadding, right: Constants.Dimensions.maxPadding)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults?.screenshotUrls?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.ScreenShotsId, for: indexPath) as! ScreenShotsCell
        let screenshots = self.appResults?.screenshotUrls?[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: screenshots ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: Constants.Dimensions.midCellHeight, height: view.frame.height)
    }
}

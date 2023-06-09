//
//  HorizontalSlidingController.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 1.02.2023.
//

import UIKit

class HorizontalSlidingController: UICollectionViewController {
    
    init() {
        let layout = SlidingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    
    //snap behaviour
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        let itemSize = collectionView.frame.width - 48
        let itemSpace = itemSize + minimumInteritemSpacing
        var pageNumber = round(collectionView.contentOffset.x / itemSpace)
        
        let vX = velocity.x
        if vX > 0 {
            pageNumber += 1
        } else if vX < 0 {
            pageNumber -= 1
        }
        let nearestPageOffset = pageNumber * itemSpace
        return CGPoint(x: nearestPageOffset, y: parent.y)
    }
}

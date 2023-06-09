//
//  DetailsScreenVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit
import SDWebImage

class DetailsScreenVC: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let detailsPageViewModel = DetailsPageViewModel()
    fileprivate let appId: String
    
    //dependency Injection constructor
    init(appId: String) {
        self.appId = appId
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.NavigationTitle.appDetailsTitle
        self.collectionView.register(DetailsScreenViewCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.DetailsPageId)
        self.collectionView.register(PreviewScreenShotsCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.PreviewPageId)
        detailsPageViewModel.fetchAppDetailsWithId(appId: appId)
        detailsPageViewModel.delegate = self
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.Sections.minSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Sections.twoSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.DetailsPageId, for: indexPath) as! DetailsScreenViewCell
            cell.appDetailsResult = detailsPageViewModel.appResultsforDetailPage?.first
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.PreviewPageId.self, for: indexPath) as! PreviewScreenShotsCell
            cell.horizontalViewController.appResults = detailsPageViewModel.appResultsforDetailPage?.first
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            
            var height: CGFloat = 280
            
            //calculate the necessary size for our cell
            let dummyCell = DetailsScreenViewCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.appDetailsResult = detailsPageViewModel.appResultsforDetailPage?.first
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
            return .init(width: view.frame.width, height: height)
        } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
}

extension DetailsScreenVC: DetailsPageViewModelDelegate {
    func onSuccessAppDetailsFetch() {
        self.collectionView.reloadData()
    }
    func onErrorAppDetailsFetch(error: Error) {
        print("Error:\(error.localizedDescription)")
    }
}

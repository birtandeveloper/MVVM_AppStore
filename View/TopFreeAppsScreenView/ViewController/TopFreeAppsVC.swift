//
//  HomeScreenVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 22.01.2023.
//

import UIKit
import SDWebImage

class TopFreeAppsVC: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let topFreeAppsViewModel = TopFreeAppsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.register(TopFreeAppsViewCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.TopFreeAppsPageId)
        navigationItem.title = Constants.NavigationTitle.topFreeAppsTitle
        topFreeAppsViewModel.fetchAppsData()
        topFreeAppsViewModel.delegate = self
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.Sections.minSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topFreeAppsViewModel.appMainResult?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.TopFreeAppsPageId, for: indexPath) as! TopFreeAppsViewCell
        let indexOfApp = topFreeAppsViewModel.appMainResult?.feed.results[indexPath.item]
        cell.appTitle.text = indexOfApp?.name ?? ""
        cell.appArtistTitle.text = indexOfApp?.artistName ?? ""
        cell.image.sd_setImage(with: URL(string: indexOfApp?.artworkUrl100 ?? ""))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let idOfClickedApp = topFreeAppsViewModel.appMainResult?.feed.results[indexPath.item].id
        let detailsVC = DetailsScreenVC(appId: idOfClickedApp ?? "")
        detailsVC.navigationItem.title = topFreeAppsViewModel.appMainResult?.feed.results[indexPath.item].name
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: Constants.Dimensions.maxCellWidth, height: Constants.Dimensions.midCellHeight)
    }
}

extension TopFreeAppsVC: TopFreeAppsViewModelDelegate {
    func onSuccessFetchingApps() {
        self.collectionView.reloadData()
    }
    
    func onErrorFetchingApps(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

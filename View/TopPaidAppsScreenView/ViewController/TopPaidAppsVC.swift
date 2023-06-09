//
//  TopPaidAppsVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 16.03.2023.
//

import UIKit
import SDWebImage

class TopPaidAppsVC: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let topPaidAppsViewModel = TopPaidAppsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(TopPaidAppsViewCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.TopPaidAppsPageId)
        navigationItem.title = Constants.NavigationTitle.topPaidAppsTitle
        topPaidAppsViewModel.fetchAppsData()
        topPaidAppsViewModel.delegate = self
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.Sections.minSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPaidAppsViewModel.appMainResult?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.TopPaidAppsPageId, for: indexPath) as! TopPaidAppsViewCell
        let indexNoOfApp = topPaidAppsViewModel.appMainResult?.feed.results[indexPath.item]
        cell.appTitle.text = indexNoOfApp?.name ?? ""
        cell.appDescription.text = indexNoOfApp?.artistName ?? ""
        cell.image.sd_setImage(with: URL(string: indexNoOfApp?.artworkUrl100 ?? ""))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let idOfClickedApp = topPaidAppsViewModel.appMainResult?.feed.results[indexPath.item].id
        let detailsVC = DetailsScreenVC(appId: idOfClickedApp ?? "")
        detailsVC.navigationItem.title = topPaidAppsViewModel.appMainResult?.feed.results[indexPath.item].name
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: Constants.Dimensions.maxCellWidth, height: Constants.Dimensions.midCellHeight)
    }
}

extension TopPaidAppsVC: TopPaidAppsViewModelDelegate {    
    func onSuccessFetchingApps() {
        self.collectionView.reloadData()
    }
    
    func onErrorFetchingApps(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

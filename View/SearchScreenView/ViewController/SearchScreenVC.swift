//
//  SearchScreenVC.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 17.03.2023.
//

import UIKit
import SwiftUI

class SearchScreenVC: BaseCollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    private let searchPageViewModel = SearchPageViewModel()
    private let searchViewCell = SearchScreenViewCell()
    private let searchController = UISearchController(searchResultsController: nil)
    let aiv = UIActivityIndicatorView(color: .white, style: .large)
    
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.automaticallyShowsCancelButton = false
        
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchViewCell.enterSearchLabelTerm.isHidden = true
        
        self.view.addSubview(self.aiv)
        aiv.startAnimating()
        self.aiv.fillSuperview()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            
            self.searchPageViewModel.fetchSearchResult(searchTerm: searchText)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            self.aiv.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchViewCell.enterSearchLabelTerm)
        searchViewCell.enterSearchLabelTerm.fillSuperview()
        
        navigationItem.title = "Search Apps"
        
        self.collectionView.register(SearchScreenViewCell.self, forCellWithReuseIdentifier: Constants.ReusableCellId.SearchScreenId)
        
        searchPageViewModel.delegate = self
        setupSearchBar()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchViewCell.enterSearchLabelTerm.isHidden = ((searchPageViewModel.appSearchPageResults?.count ?? 0) != 0)
        return searchPageViewModel.appSearchPageResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: Constants.Dimensions.maxCellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReusableCellId.SearchScreenId, for: indexPath) as! SearchScreenViewCell
        let appSearchResult = searchPageViewModel.appSearchPageResults?[indexPath.item]
        cell.searchResultApp = appSearchResult
        return cell
    }
}


extension SearchScreenVC: SearchPageViewModelDelegate {
    func onSuccessSearchResultFetch() {
        self.collectionView.reloadData()
    }
    
    func onErrorSearchResultFetch(error: Error) {
        print("Error:\(error.localizedDescription)")
    }
}

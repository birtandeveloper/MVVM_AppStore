//
//  SearchPageViewModel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 30.03.2023.
//

import UIKit

protocol SearchPageViewModelDelegate: AnyObject {
    func onSuccessSearchResultFetch()
    func onErrorSearchResultFetch(error: Error)
}

class SearchPageViewModel {
    
    private(set) var appSearchPageResults: [Results]?
    public weak var delegate: SearchPageViewModelDelegate?
    
    func fetchSearchResult(searchTerm: String) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult?, error) in
            DispatchQueue.main.async {
                self.appSearchPageResults = result?.results
                self.delegate?.onSuccessSearchResultFetch()
                
            }
        }
    }
}

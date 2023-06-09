//
//  DetailsPageViewModel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 26.01.2023.
//

import UIKit

protocol DetailsPageViewModelDelegate: AnyObject {
    func onSuccessAppDetailsFetch()
    func onErrorAppDetailsFetch(error: Error)
}

class DetailsPageViewModel {
    
    private(set) var appResultsforDetailPage: [Results]?
    public weak var delegate: DetailsPageViewModelDelegate?    
    
    func fetchAppDetailsWithId(appId: String) {
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult?, error) in
            DispatchQueue.main.async {
                self.appResultsforDetailPage = result?.results
                self.delegate?.onSuccessAppDetailsFetch()
            }
        }
    }
}

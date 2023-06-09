//
//  TopPaidAppsViewModel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 16.03.2023.
//

import UIKit

protocol TopPaidAppsViewModelDelegate: AnyObject {
    func onSuccessFetchingApps()
    func onErrorFetchingApps(error: Error)
}

class TopPaidAppsViewModel {
    
    private(set) var appMainResult: AppGroup?
    public weak var delegate: TopPaidAppsViewModelDelegate?
    
    func fetchAppsData() {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        Service.shared.fetchGenericJsonData(urlString: urlString) { (result: AppGroup?, error) in
            DispatchQueue.main.async {
                self.appMainResult = result
                self.delegate?.onSuccessFetchingApps()
            }
        }
    }
}

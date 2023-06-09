//
//  HomePageViewModel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit

protocol TopFreeAppsViewModelDelegate: AnyObject {
    func onSuccessFetchingApps()
    func onErrorFetchingApps(error: Error)
}

class TopFreeAppsViewModel {
    
    private(set) var appMainResult: AppGroup?
    public weak var delegate: TopFreeAppsViewModelDelegate?
    
    func fetchAppsData() {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        Service.shared.fetchGenericJsonData(urlString: urlString) { (result: AppGroup?, error) in
            DispatchQueue.main.async {
                self.appMainResult = result
                self.delegate?.onSuccessFetchingApps()
            }
        }
    }
}

//
//  AppsModel.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit

struct AppGroup: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Codable {
    let id, name, artistName, artworkUrl100: String
}

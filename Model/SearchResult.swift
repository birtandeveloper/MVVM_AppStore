//
//  SearchResult.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 26.01.2023.
//

import UIKit

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Codable {
    let trackId: Int?
    let trackName: String?
    let screenshotUrls: [String]?
    let artworkUrl100: String
    let formattedPrice: String?
    let description: String?
    let releaseNotes: String?
    let primaryGenreName: String?
}

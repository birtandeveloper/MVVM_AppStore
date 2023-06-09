//
//  Constants.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit

struct Constants {
    struct Dimensions {
        static let minSpacing: CGFloat = 8
        static let maxSpacing: CGFloat = 16
        static let zeroPadding: CGFloat = 0
        static let minPadding: CGFloat = 8
        static let maxPadding: CGFloat = 16
        static let minCornerRadius: CGFloat = 6
        static let maxCornerRadius: CGFloat = 12
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = 150
        static let maxCellHeight: CGFloat = 450
        static let midCellHeight: CGFloat = 250
        static let maxCellWidth: CGFloat = 200
        static let screenShotsHeight: CGFloat = 70
        static let screenShotsWidth: CGFloat = 70
        static let constraintsmax: CGFloat = 64
    }
    struct Text {
        static let minTextSize: CGFloat = 16
        static let maxTextsize: CGFloat = 20
        static let appTitleText = "App Title"
        static let appDetailsText = "App Details"
        static let appPriceText = "4,99 $"
        static let whatsnewText = "What's New"
        static let previewText = "Preview"
        static let freeAppsText = "Free Apps"
        static let paidAppSText = "Paid Apps"
        static let searchAppsText = "Search"
        static let freeAppsImageText = "apps.iphone"
        static let paidAppsImageText = "dollarsign.circle"
        static let searchImageText = "magnifyingglass"
    }
    struct Sections {
        static let minSection: Int = 1
        static let twoSection: Int = 2
        static let maxSection: Int = 5
    }
    struct ReusableCellId {
        static let TopFreeAppsPageId = "TopFreeAppsPageCellId"
        static let TopPaidAppsPageId = "TopPaidAppsPageCellId"
        static let DetailsPageId = "DetailsPageCellId"
        static let PreviewPageId = "PreviewPageCellId"
        static let ScreenShotsId = "ScreenShotsCellId"
        static let SearchScreenId = "ScreenScreenId"
    }
    struct NavigationTitle {
        static let topFreeAppsTitle = "Top Free Apps"
        static let topPaidAppsTitle = "Top Paid Apps"
        static let appDetailsTitle = "App Details"
    }
}

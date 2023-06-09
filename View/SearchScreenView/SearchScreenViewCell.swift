//
//  SearchScreenViewCell.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 17.03.2023.
//

import UIKit

class SearchScreenViewCell: UICollectionViewCell {
    
    var searchResultApp: Results! {
        didSet {
            appNameText.text = searchResultApp?.trackName ?? ""
            appCategoryText.text = searchResultApp?.primaryGenreName ?? ""
            image.sd_setImage(with: URL(string: searchResultApp?.artworkUrl100 ?? ""))
            screenShotOneImageView.sd_setImage(with: URL(string: searchResultApp?.screenshotUrls?[0] ?? ""))
            
            if (searchResultApp?.screenshotUrls?.count ?? 0) > 1 {
                screenShotTwoImageView.sd_setImage(with: URL(string: searchResultApp?.screenshotUrls?[1] ?? ""))
            }
            if (searchResultApp?.screenshotUrls?.count ?? 0) > 2 {
                screenShotThreeImageView.sd_setImage(with: URL(string: searchResultApp?.screenshotUrls?[2] ?? ""))
            }
        }
    }
    
    let enterSearchLabelTerm = UILabel(text: "Please enter App Name...", font: .boldSystemFont(ofSize: Constants.Text.maxTextsize), textAlignment: .center)
    let image = UIImageView(backgroundColor: .black, cornerRadius: Constants.Dimensions.maxCornerRadius, width: Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    let appNameText = UILabel(text: "App Name", font: .boldSystemFont(ofSize: Constants.Text.maxTextsize))
    let appCategoryText = UILabel(text: "App Category Name", font: .boldSystemFont(ofSize: Constants.Text.minTextSize))
    let appSizeText = UILabel(text: "App Size", font:
                                    .boldSystemFont(ofSize: Constants.Text.minTextSize))
    
    lazy var screenShotOneImageView = self.createScreenImageView()
    lazy var screenShotTwoImageView = self.createScreenImageView()
    lazy var screenShotThreeImageView = self.createScreenImageView()
    
    func createScreenImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = Constants.Dimensions.maxCornerRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let vStack = VerticalStackView(arrangedSubviews: [appNameText,appCategoryText,appSizeText], spacing: Constants.Dimensions.minSpacing)
        
        let stack = UIStackView(arrangedSubviews: [image,vStack],customSpacing: Constants.Dimensions.maxSpacing)
        stack.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenShotOneImageView, screenShotTwoImageView, screenShotThreeImageView],customSpacing: Constants.Dimensions.minSpacing)
        screenShotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [stack, screenShotsStackView], spacing: Constants.Dimensions.maxSpacing)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: Constants.Dimensions.zeroPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.zeroPadding, right: Constants.Dimensions.maxPadding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

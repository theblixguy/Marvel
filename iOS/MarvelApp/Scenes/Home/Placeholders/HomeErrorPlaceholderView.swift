//
//  HomePlaceholderErrorView.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit

class HomeErrorPlaceholderView: PlaceholderView {
    
    let textLabel = UILabel()
    let detailTextLabel = UILabel()
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = UIColor.white
        
        textLabel.text = "Something went wrong!"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(textLabel)
        
        detailTextLabel.text = "Try again later"
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.footnote)
        detailTextLabel.font = UIFont(descriptor: fontDescriptor, size: 0)
        detailTextLabel.textAlignment = .center
        detailTextLabel.textColor = UIColor.gray
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(detailTextLabel)
        
        let views = ["label": textLabel, "detailLabel": detailTextLabel]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[label]-|", options: .alignAllCenterY, metrics: nil, views: views)
        let hConstraintsDetail = NSLayoutConstraint.constraints(withVisualFormat: "|-[detailLabel]-|", options: .alignAllCenterY, metrics: nil, views: views)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-[detailLabel]-|", options: .alignAllCenterX, metrics: nil, views: views)
        
        centerView.addConstraints(hConstraints)
        centerView.addConstraints(hConstraintsDetail)
        centerView.addConstraints(vConstraints)
    }
    
}

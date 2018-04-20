//
//  HomePlaceholderView.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit

class PlaceholderView: UIView {
    
    let centerView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = UIColor.white
        centerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centerView)
        let views = ["centerView": centerView, "superview": self]
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[centerView]", options: .alignAllCenterX, metrics: nil, views: views)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[centerView]", options: .alignAllCenterY, metrics: nil, views: views)
        self.addConstraints(vConstraints)
        self.addConstraints(hConstraints)
    }
    
}

//
//  DetailRouter.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

@objc protocol DetailRoutingLogic {
    func routeToHome()
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
    
    func routeToHome() {
        
    }
    
    func navigateToSafariViewController(url: URL) {
        let safarVC = SFSafariViewController(url: url)
        viewController?.present(safarVC, animated: true)
    }
}

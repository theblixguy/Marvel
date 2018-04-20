//
//  ViewControllerExtensions.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

extension ViewController {
    
    func is3DTouchAvailable() -> Bool {
        if #available(iOS 9, *) {
            return traitCollection.forceTouchCapability == .available
        }
        return false
    }
}

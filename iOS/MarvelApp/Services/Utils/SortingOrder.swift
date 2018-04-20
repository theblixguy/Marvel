//
//  SortingOrder.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

enum SortingOrder: String {
    case FOC_DATE = "focDate"
    case ON_SALE_DATE = "onsaleDate"
    case TITLE = "title"
    case ISSUE_NUMBER = "issueNumber"
    case MODIFIED = "modified"
    
    case REVERSED_FOC_DATE = "-focDate"
    case REVERSED_ON_SALE_DATE = "-onsaleDate"
    case REVERSED_TITLE = "-title"
    case REVERSED_ISSUE_NUMBER = "-issueNumber"
    case REVERSED_MODIFIED = "-modified"
}

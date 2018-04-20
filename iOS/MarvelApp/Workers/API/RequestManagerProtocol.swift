//
//  RequestManagerProtocol.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

protocol RequestManagerProtocol {
    func fetchCharacters(count: Int?, orderBy: SortingOrder?, completion: @escaping (DataContainer<[Character]>?) -> Void)
}

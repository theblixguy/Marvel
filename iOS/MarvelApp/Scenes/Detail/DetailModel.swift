//
//  DetailModel.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

enum DetailModel {
    
    struct Request {
        
    }
    
    struct Response {
        var character: HomeModel.ViewModel.CharacterItem?
    }
    
    struct ViewModel {
        var characterName: String?
        var characterImageUrl: URL?
        var characterDescription: String?
        var characterDetailUrl: URL?
    }
    
}

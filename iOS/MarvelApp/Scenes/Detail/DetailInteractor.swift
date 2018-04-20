//
//  DetailInteractor.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

protocol DetailBusinessLogic {
    func getCharacter(request: DetailModel.Request)
}

protocol DetailDataStore {
    var character: HomeModel.ViewModel.CharacterItem! { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    
    var character: HomeModel.ViewModel.CharacterItem!
    
    func getCharacter(request: DetailModel.Request) {
        let response = DetailModel.Response(character: character)
        presenter?.presentCharacterDetail(response: response)
    }
    
}

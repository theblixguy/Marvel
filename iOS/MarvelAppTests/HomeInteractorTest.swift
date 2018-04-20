//
//  HomePresenterTest.swift
//  MarvelAppTests
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

@testable import MarvelApp
import XCTest

class HomeInteractorTests: XCTestCase{
    
    var interactor: HomeInteractor!
    
    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupHomeInteractor(){
        interactor = HomeInteractor()
    }
    
    class HomePresentationLogicSpy: HomePresentationLogic {
        
        var presentFetchedResultsCalled = false
        
        func presentFetchResults(response: HomeModel.Response) {
            presentFetchedResultsCalled = true
        }
    }
    
    func testGetCharactersShouldAskPresenterToFormatResult()
    {
        // Given
        let homePresentationLogicSpy = HomePresentationLogicSpy()
        interactor.presenter = homePresentationLogicSpy
        interactor.response = nil
        
        // When
        let request = HomeModel.Request()
        interactor.fetchCharacters(request: request)
        
        // Then
        XCTAssert(homePresentationLogicSpy.presentFetchedResultsCalled, "fetchCharacters() should ask presenter to format the characters")
    }
}

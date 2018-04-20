//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

@testable import MarvelApp
import XCTest

class MarvelAPIClientTest: XCTestCase {
    
    private var apiClient: MarvelAPIClient = MarvelAPIClient()
    
    func testAPIWithNoInvalidParams() {
        
        let expectation = XCTestExpectation(description: "Calls the Marvel API with limit/count set to an invalid value. This should return nothing or nil")
        
        apiClient.get(GetCharacters(limit: -128, orderBy: SortingOrder.REVERSED_MODIFIED.rawValue)) { (response) in
            switch(response) {
            case .success(_):
                XCTFail("The API should not have returned valid data! Something is broken on Marvel's end.")
                expectation.fulfill()
                break
            case .failure(let error):
                XCTAssert(type(of: error) == APIError.self, "The API client should've returned an error of type APIError. Something is broken on Marvel's end (or maybe you messed up somewhere...).")
                expectation.fulfill()
                break
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAPIClientWithValidParams() {
        
        let expectation = XCTestExpectation(description: "Calls the Marvel API with limit/count set to 10. This should return something")
        
        apiClient.get(GetCharacters(limit: 10, orderBy: SortingOrder.REVERSED_MODIFIED.rawValue)) { (response) in
            switch(response) {
            case .success(let dataContainer):
                XCTAssertNotNil(dataContainer, "Data container must not be nil!")
                XCTAssertNotNil(dataContainer.results, "Data container's results must not be nil!")
                XCTAssertEqual(dataContainer.results.count, 10, "Data container's results must contain 10 items!")
                expectation.fulfill()
                break
            case .failure(let error):
                XCTFail("The API should have returned valid data! Something is broken on Marvel's end (or maybe you messed up somewhere...). Error: \(error)")
                expectation.fulfill()
                break
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}

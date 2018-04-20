//
//  RequestManagerTest.swift
//  MarvelAppTests
//
//  Created by Suyash Srijan on 20/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

@testable import MarvelApp
import XCTest

class RequestManagerTest: XCTestCase {
    
    private var requestManager: RequestManagerProtocol = RequestManager()
    
    func testRequestManagerWithInvalidParams() {
        
        let expectation = XCTestExpectation(description: "Calls the RequestManager with limit/count set to an invalid value. This should return nothing or nil")
        
        requestManager.fetchCharacters(count: -25, orderBy: SortingOrder.ON_SALE_DATE) { (data) in
            XCTAssertNil(data, "Data must be nil!")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRequestManagerWithValidParams() {
        
        let expectation = XCTestExpectation(description: "Calls the RequestManager with limit/count set to 15. This should 15 items")
        
        requestManager.fetchCharacters(count: 15, orderBy: SortingOrder.REVERSED_MODIFIED) { (data) in
            XCTAssertNotNil(data, "Data must not be nil!")
            XCTAssertEqual(data?.results.count, 15, "Data results must contain 15 items!")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}

//
//  ServiceLocatorTests.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import XCTest
@testable import CCAppCore

class ServiceLocatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterAndProvideService() throws {
        let locator = ServiceLocator()
        locator.registerService(TestService() as TestProtocol)
        
        guard let service : TestProtocol = locator.provide() else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(service.getTrue())
    }

}

private protocol TestProtocol {
    
    func getTrue() -> Bool
    
}

private class TestService: TestProtocol {
    func getTrue() -> Bool {
        return true
    }
}

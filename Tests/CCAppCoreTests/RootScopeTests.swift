//
//  RootScopeTests.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import XCTest
@testable import CCAppCore

class RootScopeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterDependency() throws {
//        let scope = Scope()
//                    .register(Int.self, instance: 10)
//        let val: Int? = scope.provide()
        
//        XCTAssertEqual(val, 10)
    }
    
    func testProvide() throws {
//        let scope = Scope(dependency: nil)
//        let _ = scope.register(TestService.self, instance: TestService())
//
//        let service : TestService = scope.resolve(TestService.self)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

private class TestService { }

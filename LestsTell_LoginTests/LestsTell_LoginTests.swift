//
//  LestsTell_LoginTests.swift
//  LestsTell_LoginTests
//
//  Created by NewUSER on 28.06.2021.
//

import XCTest
@testable import LestsTell_Login

class LestsTell_LoginTests: XCTestCase {

    var sut: WebService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = WebService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        try super.tearDownWithError()

    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginIsSuccessful() throws {
        
        var isLogged = false
        let promise = expectation(description: "")
        //when
        sut.login(username: "primary85@mail.ru", password: "R@madan20211"){ result in
            switch result {
            case .success(_):
                //promise.fulfill()
                XCTFail("error")
                return
            case .failure(_):
                XCTFail("error")
                return
            }
        }
        //then
        wait(for: [promise], timeout: 5)    }

}

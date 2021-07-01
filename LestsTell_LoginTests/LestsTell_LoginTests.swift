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
    
    func testLoginIsSuccessful() {
        let promise = expectation(description: "")
        //when
        sut.login(username: "primary85+14@mail.ru", password: "123456"){ result in
            switch result {
            case .success(_):
                promise.fulfill()
                return
            case .failure(_):
                XCTFail("error")
                return
            }
        }
        //then
        wait(for: [promise], timeout: 5)
    }
    
    func testLoginIsFailed() {

        let promise = expectation(description: "")
        //when
        sut.login(username: "primary85+14@mail.ru", password: "123123123"){ result in
            switch result {
            case .success(_):
                XCTFail("error")
                return
            case .failure(_):
                promise.fulfill()
                return
            }
        }
        //then
        wait(for: [promise], timeout: 5)
    }
    
    func logoutIsSuccess() {
        let promise = expectation(description: "")
        sut.login(username: "primary85+14@mail.ru", password: "123456") { result in
            switch result {
            case .success(let token):
                self.sut.logout(token:token){ result in
                    switch result {
                    case .success:
                        promise.fulfill()
                    case.failure:
                        XCTFail("lgout is failed")
                    }
                    
                }
            case.failure(_):
            XCTFail("Loging is failed")
            }
        }
    }
}

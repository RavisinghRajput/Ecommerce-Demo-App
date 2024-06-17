//
//  LoginViewModelTest.swift
//  EcommerceDemoAppTests
//
//  Created by Ravi Kumar Singh on 15/06/24.
//

import XCTest
@testable import EcommerceDemoApp

final class LoginViewModelTest: XCTestCase {
    var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testEmptyEmailShowsAlert() {
        viewModel.validateInputs("", "Password1")
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.alertMessage, StaticMessage.emailEmpty)
        XCTAssertFalse(viewModel.navigate)
    }
    
    func testInvalidEmailShowsAlert() {
        viewModel.validateInputs("invalidemail", "Password1")
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.alertMessage, StaticMessage.emailInvalid)
        XCTAssertFalse(viewModel.navigate)
    }
    
    func testEmptyPasswordShowsAlert() {
        viewModel.validateInputs("test@example.com", "")
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.alertMessage, StaticMessage.passwordEmpty)
        XCTAssertFalse(viewModel.navigate)
    }
    
    func testInvalidPasswordShowsAlert() {
        viewModel.validateInputs("test@example.com", "short")
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.alertMessage, StaticMessage.passwordInvalidHints)
        XCTAssertFalse(viewModel.navigate)
    }
    
    func testValidInputsNavigate() {
        viewModel.validateInputs("test@example.com", "Password1")
        XCTAssertFalse(viewModel.showAlert)
        XCTAssertTrue(viewModel.navigate)
    }
    
    func testIsValidEmail() {
        XCTAssertTrue(viewModel.isValidEmail("test@example.com"))
        XCTAssertFalse(viewModel.isValidEmail("invalidemail"))
    }
    
    func testIsValidPassword() {
        XCTAssertTrue(viewModel.isValidPassword("Password1"))
        XCTAssertFalse(viewModel.isValidPassword("short"))
    }
}

    


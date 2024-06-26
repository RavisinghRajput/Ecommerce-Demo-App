//
//  LoginViewUITests.swift
//  EcommerceDemoAppUITests
//
//  Created by Ravi Kumar Singh on 17/06/24.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testEmptyEmail() {
        let emailTextField = app.textFields["Email"]
        let passwordTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        emailTextField.tap()
        emailTextField.typeText("")
        
        passwordTextField.tap()
        passwordTextField.typeText("Password@123")
        
        loginButton.tap()
        
        // Check if alert appears
        let alert = app.alerts.firstMatch
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: alert, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(alert.exists)
        XCTAssertEqual(alert.label, "Alert!")
        XCTAssertTrue(alert.staticTexts["Email cannot be empty."].exists)
    }
    
    func testEmptyPassword() {
        let emailTextField = app.textFields["Email"]
        let passwordTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        emailTextField.tap()
        emailTextField.typeText("test@gmail.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        loginButton.tap()
        
        // Check if alert appears
        let alert = app.alerts.firstMatch
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: alert, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(alert.exists)
        XCTAssertEqual(alert.label, "Alert!")
        XCTAssertTrue(alert.staticTexts["Password cannot be empty."].exists)
    }
    
    func testSuccessfulLogin() {
        let emailTextField = app.textFields["Email"]
        let passwordSecureField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        passwordSecureField.tap()
        passwordSecureField.typeText("Password@123")
        
        loginButton.tap()
        
        // Wait for the navigation to occur
        let tabBarView = app.otherElements["TabBarView"]
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: tabBarView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(tabBarView.exists, "The user should be navigated to the TabBarView on successful login")
    }
}

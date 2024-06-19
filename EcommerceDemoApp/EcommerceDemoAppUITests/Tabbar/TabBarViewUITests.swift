//
//  TabBarViewUITests.swift
//  EcommerceDemoAppUITests
//
//  Created by Ravi Kumar Singh on 17/06/24.

    import XCTest

    final class TabBarViewTests: XCTestCase {
        
        var app: XCUIApplication!
        
        override func setUpWithError() throws {
            continueAfterFailure = false
            
            app = XCUIApplication()
            app.launch()
        }
        
        func testTabBarNavigation() throws {
            // Ensure the TabBarView is present
            let tabBarView = app.otherElements["TabBarView"]
            XCTAssertTrue(tabBarView.waitForExistence(timeout: 50), "TabBarView")
            
            // Check for the existence of the Home tab and tap it
            let homeTab = app.buttons["Home"]
            XCTAssertTrue(homeTab.exists, "The Home tab should exist")
            homeTab.tap()
            
            // Verify that the HomePageView is displayed
            let homePageView = app.otherElements["Home"]
            XCTAssertTrue(homePageView.waitForExistence(timeout: 50), "HomePageView")
            
            // Check for the existence of the Cart tab and tap it
            let cartTab = app.buttons["Cart"]
            XCTAssertTrue(cartTab.exists, "The Cart tab should exist")
            cartTab.tap()
            
            // Verify that the CartPageView is displayed
            let cartPageView = app.otherElements["Cart"]
            XCTAssertTrue(cartPageView.waitForExistence(timeout: 5), "The CartPageView should be displayed after tapping the Cart tab")
            
            // Check for the existence of the Profile tab and tap it
            let profileTab = app.buttons["Profile"]
            XCTAssertTrue(profileTab.exists, "The Profile tab should exist")
            profileTab.tap()
            
            // Verify that the UserProfileView is displayed
            let userProfileView = app.otherElements["Profile"]
            XCTAssertTrue(userProfileView.waitForExistence(timeout: 5), "The UserProfileView should be displayed after tapping the Profile tab")
        }
    }


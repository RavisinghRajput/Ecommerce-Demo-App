//
//  UserProfileViewTests.swift
//  EcommerceDemoAppUITests
//
//  Created by Ravi Kumar Singh on 18/06/24.
//

import XCTest

final class UserProfileViewTests: XCTestCase {

        var app: XCUIApplication!
        
        override func setUpWithError() throws {
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }
        
        func testUserProfileView() throws {
            // Assuming the app launches to a view from which we can navigate to UserProfileView.
            // Navigate to UserProfileView
            
            // Example: Navigate to Profile from Home Page
            let profileTab = app.tabBars.buttons["Profile"]
            XCTAssertTrue(profileTab.exists, "The Profile tab should be present")
            profileTab.tap()
            
            // Now we are presumably in the UserProfileView
            let profile = app.otherElements["Profile"]
            XCTAssertTrue(profile.exists, "The UserProfileView should exist")
            
            // Ensure the profile image is displayed
            let profileImage = app.images["profileImage"]
            XCTAssertTrue(profileImage.exists, "The profile image should be present in UserProfileView")
            
            // Ensure the user name is displayed
            let userName = app.staticTexts["userName"]
            XCTAssertTrue(userName.exists, "The user name should be present in UserProfileView")
            
            // Ensure the user email is displayed
            let userEmail = app.staticTexts["userEmail"]
            XCTAssertTrue(userEmail.exists, "The user email should be present in UserProfileView")
            
            // Ensure the "Your Orders" section is displayed
            let yourOrders = app.staticTexts["yourOrders"]
            XCTAssertTrue(yourOrders.exists, "The 'Your Orders' section should be present in UserProfileView")
            
            // Ensure the "Your Address" section is displayed
            let yourAddress = app.staticTexts["YourAddress"]
            XCTAssertTrue(yourAddress.exists, "The 'Your Address' section should be present in UserProfileView")
            
            // Ensure the "Account Settings" section is displayed
            let accountSettings = app.staticTexts["accountSettings"]
            XCTAssertTrue(accountSettings.exists, "The 'Account Settings' section should be present in UserProfileView")
            
            // Test the "Edit Profile" button
            let editProfileButton = app.buttons["editProfile"]
            XCTAssertTrue(editProfileButton.exists, "The 'Edit Profile' button should be present in UserProfileView")
            editProfileButton.tap()
            
            // Test the "Save Card" button
            let saveCardButton = app.buttons["saveCard"]
            XCTAssertTrue(saveCardButton.exists, "The 'Save Card' button should be present in UserProfileView")
            saveCardButton.tap()
            
            // Test the "Notifications" button
            let notificationsButton = app.buttons["notifications"]
            XCTAssertTrue(notificationsButton.exists, "The 'Notifications' button should be present in UserProfileView")
            notificationsButton.tap()
            
            // Test the "Contact Us" button
            let contactUsButton = app.buttons["contactUs"]
            XCTAssertTrue(contactUsButton.exists, "The 'Contact Us' button should be present in UserProfileView")
            contactUsButton.tap()
            
            // Test the "Terms and Policy" button
            let termsAndPolicyButton = app.buttons["termsAndPolicy"]
            XCTAssertTrue(termsAndPolicyButton.exists, "The 'Terms and Policy' button should be present in UserProfileView")
            termsAndPolicyButton.tap()
            
            // Test the "Question and Answer" button
            let questionAnswerButton = app.buttons["questionAnswer"]
            XCTAssertTrue(questionAnswerButton.exists, "The 'Question and Answer' button should be present in UserProfileView")
            questionAnswerButton.tap()
        }
    }

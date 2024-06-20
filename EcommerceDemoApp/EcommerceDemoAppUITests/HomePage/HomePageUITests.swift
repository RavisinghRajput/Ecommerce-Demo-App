//
//  HomePageUITests.swift
//  EcommerceDemoAppUITests
//
//  Created by Ravi Kumar Singh on 17/06/24.
//

import XCTest

final class HomePageUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testHomePageView() throws {
        // Ensure the search bar is present
        let searchBar = app.textFields["searchBarText"]
        //XCTAssertTrue(searchBar.exists, "The search bar should be present on the Home Page")
        
        // Perform a search
        //            searchBar.tap()
        //            searchBar.typeText("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops") // Replace with an actual product name for real testing
        
        // Ensure the product list is updated
        let productCell = app.staticTexts[String(1)] // Replace with a valid product ID
        XCTAssertTrue(productCell.exists, "The product should be present in the list after search")
        
        // Tap on the product to navigate to the product details view
        productCell.tap()
        
        // Ensure the product details view is shown
        let productDetailTitle = app.staticTexts["Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"] // Replace with an actual identifier for product details view
        XCTAssertTrue(productDetailTitle.exists, "The product details view should be displayed")
    }
}

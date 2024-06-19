//
//  ProductDetailsViewTests.swift
//  EcommerceDemoAppUITests
//
//  Created by Ravi Kumar Singh on 18/06/24.
//

import XCTest

final class ProductDetailsViewTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testProductDetailsView() throws {
        // Assuming the app launches to a view from which we can navigate to ProductDetailsView.
        // Navigate to ProductDetailsView
        
        // Example: Navigate to Product Details from Home Page
        let homeTab = app.tabBars.buttons["Home"]
        XCTAssertTrue(homeTab.exists, "The Home tab should be present")
        homeTab.tap()
        
        let firstProduct = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstProduct.exists, "The first product cell should be present")
        firstProduct.tap()
        
        // Now we are presumably in the ProductDetailsView
//        let productImage = app.images["image"]
//        XCTAssertTrue(productImage.exists, "The product image should be present in ProductDetailsView")
        
        // Ensure the product title is displayed
        let productTitle = app.staticTexts["productTitle"]
        XCTAssertTrue(productTitle.exists, "The product title should be present in ProductDetailsView")
        
        // Ensure the product description is displayed
        let productDescription = app.staticTexts["productDescription"]
        XCTAssertTrue(productDescription.exists, "The product description should be present in ProductDetailsView")
        
        // Ensure the rating info is displayed
        let ratingInfo = app.otherElements["ratingInfo"]
       // XCTAssertTrue(ratingInfo.exists, "The rating info should be present in ProductDetailsView")
        
        // Ensure the price info is displayed
        let priceInfo = app.staticTexts["priceInfo"]
        XCTAssertTrue(priceInfo.exists, "The price info should be present in ProductDetailsView")
        
        // Test the add to cart button
        let addToCartButton = app.buttons["addToCartButton"]
        XCTAssertTrue(addToCartButton.exists, "The add to cart button should be present in ProductDetailsView")
        addToCartButton.tap()
        
        // Test the buy now button
        let buyNowButton = app.buttons["buyNowButton"]
        XCTAssertTrue(buyNowButton.exists, "The buy now button should be present in ProductDetailsView")
        buyNowButton.tap()
    }
}

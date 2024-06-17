//
//  ProductDetailsViewModelTests.swift
//  EcommerceDemoAppTests
//
//  Created by Ravi Kumar Singh on 16/06/24.
//

import XCTest
@testable import EcommerceDemoApp

final class ProductDetailsViewModelTests: XCTestCase {
    var viewModel: ProductDetailsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ProductDetailsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertTrue(viewModel.addToCartProduct.isEmpty)
        XCTAssertEqual(viewModel.cartProductCount, 0)
        XCTAssertEqual(viewModel.totalCartPrice, 0.0)
    }

    func testAddItem() {
        viewModel.addItem()
        XCTAssertEqual(viewModel.cartProductCount, 1)
    }

    func testAddProduct() {
        let product = CartProductModel(id: 1, title: "Product 1", description: "Description 1", category: "Category 1", image: "image 1", price: 100.0, quantity: 1, rating: Rating(rate: 4.0, count: 1))
        viewModel.addProduct(product)
        XCTAssertEqual(viewModel.addToCartProduct.count, 1)
        XCTAssertEqual(viewModel.addToCartProduct.first?.title, "Product 1")
    }

    func testRemoveProduct() {
        let product = CartProductModel(id: 1, title: "Product 1", description: "Description 1", category: "Category 1", image: "image 1", price: 100.0, quantity: 1, rating: Rating(rate: 4.0, count: 1))
        viewModel.addProduct(product)
        XCTAssertEqual(viewModel.addToCartProduct.count, 1)
        
        viewModel.removeProduct(at: IndexSet(integer: 0))
        XCTAssertTrue(viewModel.addToCartProduct.isEmpty)
    }

    func testTotalCartPrice() {
        let product1 = CartProductModel(id: 1, title: "Product 1", description: "Description 1", category: "Category 1", image: "image 1", price: 100.0, quantity: 1, rating: Rating(rate: 4.0, count: 1))
        let product2 = CartProductModel(id: 1, title: "Product 1", description: "Description 1", category: "Category 1", image: "image 1", price: 100.0, quantity: 1, rating: Rating(rate: 4.0, count: 1))
        viewModel.addProduct(product1)
        viewModel.addProduct(product2)
        
        XCTAssertEqual(viewModel.totalCartPrice, 200.0) 
    }
}

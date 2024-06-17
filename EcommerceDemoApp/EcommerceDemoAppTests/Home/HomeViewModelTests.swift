//
//  HomeViewModelTests.swift
//  EcommerceDemoAppTests
//
//  Created by Ravi Kumar Singh on 15/06/24.
//

import XCTest
@testable import EcommerceDemoApp

class MockAPIManager: APIManagerProtocol {
    var shouldReturnError = false
    var mockProducts: [ProductModel] = []

    func request<T: Decodable>(modelType: T.Type, type: EndPointType, completion: @escaping (Result<T, Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "MockError", code: 1, userInfo: nil)
            completion(.failure(error))
        } else {
            completion(.success(mockProducts as! T))
        }
    }
}

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockAPIManager: MockAPIManager!

    override func setUp() {
        super.setUp()
        mockAPIManager = MockAPIManager()
        viewModel = HomeViewModel(apiManager: mockAPIManager)
    }

    override func tearDown() {
        viewModel = nil
        mockAPIManager = nil
        super.tearDown()
    }

    func testFetchProductsSuccess() {
        let mockProducts = [
            ProductModel(id: 1, title: "Product 1", description: "Description 1", category: "Category 1", image: "image 1", price: 100.0, rating: Rate(rate: 4.0, count: 1)),
            ProductModel(id: 2, title: "Product 2", description: "Description 2", category: "Category 2", image: "image 2", price: 100.0, rating: Rate(rate: 4.0, count: 1))
        ]
        mockAPIManager.mockProducts = mockProducts

        let expectation = self.expectation(description: "Fetch products")
        viewModel.fetchProducts()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2, handler: nil)

        XCTAssertEqual(viewModel.products.count, mockProducts.count)
        XCTAssertEqual(viewModel.products[0].title, "Product 1")
        XCTAssertEqual(viewModel.products[1].title, "Product 2")
    }

    func testFetchProductsFailure() {
        mockAPIManager.shouldReturnError = true

        let expectation = self.expectation(description: "Fetch products")
        viewModel.fetchProducts()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2, handler: nil)

        XCTAssertTrue(viewModel.products.isEmpty)
    }
}


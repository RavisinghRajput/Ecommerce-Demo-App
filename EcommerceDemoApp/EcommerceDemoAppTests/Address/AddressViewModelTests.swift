//
//  AddressViewModelTests.swift
//  EcommerceDemoAppTests
//
//  Created by Ravi Kumar Singh on 16/06/24.
//

import XCTest
@testable import EcommerceDemoApp

final class AddressViewModelTests: XCTestCase {
  
        var viewModel: AdressViewModel!
        
        override func setUp() {
            super.setUp()
            viewModel = AdressViewModel()
        }
        
        override func tearDown() {
            viewModel = nil
            super.tearDown()
        }
        
        func testAddAddress() {
            // Given
            let address = AddressModel(id: 2, firstName: "First name 2", lastName: "Last name 2", dorNumber: "1", streetName: "123 Main St 1", pinCode: 100001)
            
            // When
            viewModel.addAdress(address)
            
            // Then
            XCTAssertTrue(viewModel.userAdress.contains(address), "The address should be added to the userAdress array")
        }
        
        func testRemoveAddress() {
            // Given
            let address1 = AddressModel(id: 1, firstName: "First", lastName: "Last", dorNumber: "1", streetName: "123 Main St", pinCode: 100001)
            let address2 = AddressModel(id: 2, firstName: "First name 2", lastName: "Last name 2", dorNumber: "1", streetName: "123 Main St 1", pinCode: 100001)
            viewModel.addAdress(address1)
            viewModel.addAdress(address2)
            
            // When
            viewModel.removeAdress(at: IndexSet(integer: 0))
            
            // Then
            XCTAssertFalse(viewModel.userAdress.contains(address1), "The address1 should be removed from the userAdress array")
            XCTAssertTrue(viewModel.userAdress.contains(address2), "The address2 should still be in the userAdress array")
        }
    }


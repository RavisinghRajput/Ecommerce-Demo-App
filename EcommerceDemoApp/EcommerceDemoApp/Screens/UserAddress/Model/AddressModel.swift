//
//  AddressModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 31/05/24.
//

import Foundation

struct AddressModel: Identifiable, Equatable {
    var id: Int
    let firstName: String
    let lastName: String
    let dorNumber: String
    let streetName: String
    let pinCode: Int?
    
    static var dummy: AddressModel {
        return AddressModel(id: 1, firstName: "Test", lastName: "Test1", dorNumber: "304", streetName: "1st street ", pinCode: 100001)
     }
}


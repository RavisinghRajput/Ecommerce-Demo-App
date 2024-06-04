//
//  UserModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 29/05/24.
//

import Foundation
struct UserModel: Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let profileImageName: String
    
    static var dummy: UserModel {
        return UserModel(id: 1, firstName: "Ravi", lastName: "Singh", email: "ravi@gmail.com", profileImageName: "person.fill")
    }
}

struct OrderModel: Identifiable {
    let id: Int
    let orderNumber: String
    let date: String
    let totalAmount: Double
    
    static var dummy: OrderModel {
        return OrderModel(id: 1, orderNumber: "1", date: "24/05/2024", totalAmount: 200.0)
     }
}

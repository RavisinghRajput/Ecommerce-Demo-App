//
//  ProfileViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 24/05/24.
//

import Foundation
import Combine
class ProfileViewModel: ObservableObject {
    @Published var user: UserModel
    @Published var orders: [OrderModel]

    init(user: UserModel, orders: [OrderModel]) {
        self.user = user
        self.orders = orders
    }
}

//
//  CartViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 28/05/24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartProduct: [CartProductModel] = [CartProductModel]()

    //Cart total Price calculation
    var totalCartPrice: Double {
        cartProduct.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    //Remove Product from cart
    func removeProduct(at offsets: IndexSet) {
        cartProduct.remove(atOffsets: offsets)
        }
    
}

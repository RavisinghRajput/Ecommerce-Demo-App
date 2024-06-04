//
//  ProductDetailsViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation

class ProductDetailsViewModel: ObservableObject {
    @Published var addToCartProduct: [CartProductModel] = [CartProductModel]()
    @Published var cartProductCount: Int = 0
    
    // Function to add an item to the cart
    func addItem() {
        cartProductCount += 1 // Use the addition result to update cartCount
    }
    
    //Cart total Price calculation
    var totalCartPrice: Double {
        addToCartProduct.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    //Item add in cart
    func addProduct(_ product: CartProductModel) {
        addToCartProduct.append(product)
    }
    
    func removeProduct(at offsets: IndexSet) {
        addToCartProduct.remove(atOffsets: offsets)
    }
    
}

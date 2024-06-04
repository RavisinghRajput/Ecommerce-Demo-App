//
//  ProductModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    let id: Int
    let title, description, category, image: String
    let price: Double
    let rating: Rate
    
    static var dummy: ProductModel {
        return ProductModel(id: 1,
                            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men\'s clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", price: 109.95, rating: Rate(rate: 3.9, count: 120))
    }
}

struct Rate: Codable {
    let rate: Double
    let count: Int
}

extension ProductModel: Equatable {
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.category == rhs.category &&
        lhs.image == rhs.image &&
        lhs.price == rhs.price &&
        lhs.rating.rate == rhs.rating.rate &&
        lhs.rating.count == rhs.rating.count
    }
}

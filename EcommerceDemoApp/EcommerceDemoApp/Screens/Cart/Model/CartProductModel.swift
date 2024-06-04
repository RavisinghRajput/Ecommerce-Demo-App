//
//  CartProductModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation
import Combine

class CartProductModel: ObservableObject, Identifiable {
    
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var category: String = ""
    var image: String = ""
    var price: Double = 0.0
    var quantity: Int = 0
    var rating: Rating
    
    init(id:Int, title: String, description: String, category: String,image: String, price: Double, quantity: Int, rating: Rating) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.image = image
        self.price = price
        self.quantity = quantity
        self.rating = rating
    }
    
}

struct Rating: Decodable {
    let rate: Double
    let count: Int
}

extension CartProductModel: Equatable {
    static func == (lhs: CartProductModel, rhs: CartProductModel) -> Bool {
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


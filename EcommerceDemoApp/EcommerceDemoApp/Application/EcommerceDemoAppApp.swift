//
//  EcommerceDemoAppApp.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI

@main
struct EcommerceDemoAppApp: App {
    let persistenceController = PersistenceController.shared
    var badgeCount = CartProductModel(id: 1, title: "", description: "", category: "", image: "", price: 1.0, quantity: 1, rating: Rating(rate: 1.0, count: 1))
    @StateObject private var productDetailsViewModel = ProductDetailsViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var adressViewModel = AdressViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(badgeCount)
                .environmentObject(productDetailsViewModel)
                .environmentObject(cartViewModel)
                .environmentObject(adressViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

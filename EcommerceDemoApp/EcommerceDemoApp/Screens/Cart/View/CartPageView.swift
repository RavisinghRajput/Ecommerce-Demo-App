//
//  CartPageView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI
struct CustomNavigationBar: UIViewControllerRepresentable {
    var backgroundColor: UIColor
    var titleColor: UIColor

    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: ContentView()))

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}


struct CartPageView: View {
    @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModel
    @EnvironmentObject var cartViewModel : CartViewModel
    
    @State private var isScrolledUp = false
        @State private var totalAmount: Double = 150.00
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                
                if productDetailsViewModel.cartProductCount == 0 {
                    
                    HStack {
                        Text(StaticMessage.emptyCartTitle)
                        Image(systemName: "cart.fill.badge.plus")

                    }
                    .padding(8)
                } else {
                    VStack(spacing: 0){
                        List {
                            ForEach(productDetailsViewModel.addToCartProduct) { cartProduct in
                                CartProductRowView(product: cartProduct)
                                
                            }.background(Color.clear)
                                .padding(.bottom, 50)
                            
                        }
                        .listStyle(PlainListStyle())
                        VStack {
                            OrderCountView(cartCount: productDetailsViewModel.cartProductCount , totalAmount: productDetailsViewModel.totalCartPrice)
                                .padding(.bottom, 100) // Adjust padding as needed
                        }

                    }
                }
            }
            
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle(StaticMessage.cartNavigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                Color.blue, for: .navigationBar)
        }
        
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(backgroundColor: .systemRed, titleColor: .white)
    }
}



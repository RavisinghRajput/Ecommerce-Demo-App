//
//  HomePageView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchBarText: String = String()
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack
        {
            SearchBarView(searchBarText: $searchBarText)
                .accessibilityIdentifier("searchBarText")
            NavigationStack {
                List
                {
                    ForEach(viewModel.products.filter({searchBarText.isEmpty ? true : $0.title.contains(searchBarText)}), id: \.id){ product in
                        NavigationLink {
                            ProductDetailsView(products: product)
                        } label: {
                            HomeProductRowView(product: product)
                                .accessibilityIdentifier("product_\(product.id)")

                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarBackButtonHidden(true)
                .accessibility(identifier: "HomePageView")
            }
            .task {
                await viewModel.fetchProducts()
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

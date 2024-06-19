//
//  TabBarView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import SwiftUI

struct TabBarView: View {
//    struct TabBarView: View {
//
//        @State private var defaultView: Int = 0
//        @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModel
//
//        var body: some View {
//            TabView(selection: $defaultView) {
//
//                HomePageView()
//                    .tabItem {
//                        Text(StaticMessage.homeTabTitle)
//                        Image(systemName: "house")
//                    }
//                    .tag(0)
//                    .accessibility(identifier: "homeTab")
//
//                CartPageView()
//                    .tabItem {
//                        Text(StaticMessage.cartTabTitle)
//                        Image(systemName: "cart.fill.badge.plus")
//                    }
//                    .tag(1)
//                    .badge(productDetailsViewModel.cartProductCount)
//                    .accessibility(identifier: "cartTab")
//
//                UserProfileView(viewModel: ProfileViewModel(user: UserModel.dummy, orders: [OrderModel.dummy]))
//                    .tabItem {
//                        Text(StaticMessage.profileTabTitle)
//                        Image(systemName: "person.fill")
//                    }
//                    .tag(2)
//                    .accessibility(identifier: "profileTab")
//            }
//            .accentColor(.blue)
//            .background(Color.red)
//            .navigationBarBackButtonHidden(true)
//            .accessibility(identifier: "TabBarView")
//        }
//    }

    
    @State private var defaultView : Int = 0
    @EnvironmentObject var productDetailsViewModel : ProductDetailsViewModel
    var body: some View {
        TabView(selection: $defaultView){

            HomePageView()
                .tabItem {
                    Text(StaticMessage.homeTabTitle)
                    Image(systemName: "house")
                }.tag(0)
                .accessibility(identifier: "Home")

            CartPageView()
                .tabItem {
                    Text(StaticMessage.cartTabTitle)
                    Image(systemName: "cart.fill.badge.plus")
                }.tag(1)
                .badge(productDetailsViewModel.cartProductCount)
                .accessibility(identifier: "Cart")

            UserProfileView(viewModel: ProfileViewModel.init(user: UserModel.dummy, orders: [OrderModel.dummy]))
                .tabItem {
                    Text(StaticMessage.profileTabTitle)
                    Image(systemName: "person.fill")
                }.tag(2)
                .accessibility(identifier: "Profile")

        }.accentColor(.blue)
            .background(Color.red)
            .navigationBarBackButtonHidden(true)
            .accessibility(identifier: "TabBarView")
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

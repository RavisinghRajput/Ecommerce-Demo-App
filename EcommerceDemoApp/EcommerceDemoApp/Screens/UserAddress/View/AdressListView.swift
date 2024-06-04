//
//  AdressListView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 31/05/24.
//

import SwiftUI
import CoreData
struct AdressListView: View {
    let adress: AddressModel
    @EnvironmentObject var viewModel: AdressViewModel
    var body: some View {
        List {
            ForEach(viewModel.userAdress) { item in
                NavigationLink {
                    AdressView(adress: item)
                } label: {
                    UserAdressRowView(adress: item)
                }
            }
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: AdressView(adress: AddressModel.dummy)) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        viewModel.removeAdress(at: IndexSet(integer: viewModel.userAdress.firstIndex(of: adress)!))
        
    }
}

struct AdressListView_Previews: PreviewProvider {
    static var previews: some View {
        AdressListView(adress: AddressModel.dummy)
    }
}

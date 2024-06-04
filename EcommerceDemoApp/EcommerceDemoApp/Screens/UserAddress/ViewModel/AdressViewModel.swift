//
//  AdressViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 31/05/24.
//

import Foundation

class AdressViewModel: ObservableObject {
    @Published var userAdress: [AddressModel] = [AddressModel]()
  
    
    //Add Address
    func addAdress(_ adress: AddressModel) {
        userAdress.append(adress)
    }
    
    //Remove Address
    func removeAdress(at offsets: IndexSet) {
        userAdress.remove(atOffsets: offsets)
        }
    
}

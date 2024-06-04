//
//  HomeViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    
    func fetchProducts() {
        APIManger.shared.request(
            modelType: [ProductModel].self,
            type: ProductEndPoint.products) { response in
                switch response {
                case .success(let products):
                    DispatchQueue.main.async {
                        self.products = products
                    }
                    
                case .failure(let error):
                    return debugPrint(error)
                }
            }
    }
}

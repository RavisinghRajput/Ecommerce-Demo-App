//
//  HomeViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    private let apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManger.shared) {
         self.apiManager = apiManager
     }
    func fetchProducts() {
            apiManager.request(modelType: [ProductModel].self, type: ProductEndPoint.products) { response in
                switch response {
                case .success(let products):
                    print(products)
                    DispatchQueue.main.async {
                        self.products = products
                    }
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
}

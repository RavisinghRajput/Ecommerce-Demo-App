//
//  OrderCountView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 28/05/24.
//

import SwiftUI

struct OrderCountView: View {
    var cartCount: Int
    var totalAmount: Double
    
    var body: some View {
        HStack {
            Text("Items: \(cartCount)")
                .font(.headline)
                .padding()

            Spacer()

            Text("Total: $\(String(format: "%.2f", totalAmount))")
                .font(.headline)
                .padding()
        }
       // .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        //.padding(.horizontal)
    }
}

struct OrderCountView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCountView(cartCount: 0, totalAmount: 0.0)
    }
}

//
//  UserAdressRowView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 31/05/24.
//

import SwiftUI

struct UserAdressRowView: View {
    let adress: AddressModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(adress.firstName).font(.title3)
            Text(adress.lastName)
            Text(adress.dorNumber)
            Text(adress.streetName)
            Text(String(adress.pinCode ?? 000000))
        }.padding()
    }
}

struct UserAdressRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserAdressRowView(adress: AddressModel.dummy)
    }
}

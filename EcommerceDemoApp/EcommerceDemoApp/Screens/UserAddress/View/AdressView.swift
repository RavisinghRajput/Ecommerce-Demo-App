//
//  AdressView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 30/05/24.
//

import SwiftUI

struct AdressView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dorFlatNo: String = ""
    @State private var streetName: String = ""
    @State private var pinCode: String = ""
    let adress: AddressModel
    @EnvironmentObject var adressViewModel : AdressViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        VStack {
            Text(StaticMessage.addressViewTitle).font(.largeTitle).padding()
            
            TextField(StaticMessage.firstNameTitle, text: $firstName)
                .padding()
                .cornerRadius(4.0)
                .border(Color.gray, width: 2)
                .foregroundColor(Color.black )
            
            
            TextField(StaticMessage.lastNameTitle, text: $lastName)
                .padding()
                .cornerRadius(4.0)
                .border(Color.gray, width: 2)
                .foregroundColor(Color.black )
            
            TextField(StaticMessage.dorNoTitle, text: $dorFlatNo)
                .padding()
                .cornerRadius(4.0)
                .border(Color.gray, width: 2)
                .foregroundColor(Color.black )
                .keyboardType(.numberPad)
            
            TextField(StaticMessage.streetTitle, text: $streetName)
                .padding()
                .cornerRadius(4.0)
                .border(Color.gray, width: 2)
                .foregroundColor(Color.black )
            
            TextField(StaticMessage.pincodeTitle, text: $pinCode)
                .padding()
                .cornerRadius(4.0)
                .border(Color.gray, width: 2)
                .foregroundColor(Color.black )
                .keyboardType(.numberPad)
            
            Button {
                adressViewModel.addAdress(AddressModel(id: 1, firstName: firstName, lastName: lastName, dorNumber: dorFlatNo, streetName: streetName, pinCode: Int(pinCode)))
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("SAVE")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
        }.padding()
    }
  }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(adress: AddressModel.dummy)
    }
}

//
//  LoginView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 29/05/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isUsernameValid = false
    @State private var isPasswordValid = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(StaticMessage.loginTitle).font(.largeTitle).padding()
                        .foregroundColor(.blue)
                    
                    //Login TextField
                    TextField(StaticMessage.usernamePlaceholder, text: $email)
                        .padding()
                        .foregroundColor(isUsernameValid ? Color.black : Color.red)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .cornerRadius(5)
                        .border(Color.gray, width: 2)
                        .onChange(of: email) { newValue in
                            isUsernameValid = viewModel.isValidEmail(newValue)
                        }
                        .accessibility(identifier: "Email") // Set accessibility identifier

                    
                    //Password TextField
                    SecureField(StaticMessage.passwordPlaceholder, text: $password)
                        .padding()
                        .foregroundColor(isPasswordValid ? Color.black : Color.red)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .cornerRadius(100)
                        .border(Color.gray, width: 2)
                        .onChange(of: password) { newValue in
                            isPasswordValid = viewModel.isValidPassword(newValue)
                        }
                        .accessibility(identifier: "Password") // Set accessibility identifier

                    
                    //Login Button
                    Button(StaticMessage.loginButtonTitle) {
                        viewModel.validateInputs(email, password)
                    }
                    .padding()
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text(StaticMessage.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(StaticMessage.alertOkButton)))
                        
                    }
                    .accessibility(identifier: "LoginAlert") // Set accessibility identifier for the alert
                    .accessibility(identifier: "Login") // Set accessibility identifier

                    NavigationLink(destination: TabBarView(), isActive: $viewModel.navigate) {
                       
                        EmptyView()
                    }
                }.padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

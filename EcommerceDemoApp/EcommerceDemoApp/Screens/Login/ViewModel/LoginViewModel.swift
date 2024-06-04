//
//  LoginViewModel.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 29/05/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var navigate: Bool = false
    private let helper = ValidationHelper()
    
    func validateLogin(_ email: String?, password: String?) -> ValidationType {
        helper.validateLogin(email, password: password)
    }
    
    func validateInputs(_ emailId: String, _ password: String) {
            if emailId.isEmpty {
                alertMessage = StaticMessage.emailEmpty
                showAlert = true
            } else if !isValidEmail(emailId) {
                alertMessage = StaticMessage.emailInvalid
                showAlert = true
            } else if password.isEmpty {
                alertMessage = StaticMessage.passwordEmpty
                showAlert = true
            } else if !isValidPassword(password) {
                alertMessage = StaticMessage.passwordInvalidHints
                showAlert = true
            } else {
                navigate = true
            }
        }

    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
   
    func isValidPassword(_ password: String) -> Bool {
        // Example password criteria: At least 8 characters, 1 uppercase letter, 1 number
        let passwordFormat = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: password)
    }
    
}

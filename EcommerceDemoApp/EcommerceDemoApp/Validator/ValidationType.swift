//
//  ValidationType.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 29/05/24.
//

import Foundation

enum ValidationType: String {
    case emptyEmail = "Email cannot be empty"
    case emptyPassword = "Password cannot be empty"
    case lengthPassword = "Password should be more then 8 characters"
    case success = "Success"
}

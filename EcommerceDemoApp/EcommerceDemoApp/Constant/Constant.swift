//
//  Constant.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation

enum Constant {
    enum API {
        static let productURL = "https://fakestoreapi.com/products"
    }
}

struct StaticMessage {
    //Login
    static let loginTitle = "Login"
    static let usernamePlaceholder = "Enter your username"
    static let passwordPlaceholder = "Enter your password"
    static let loginButtonTitle = "Login"
    
    static let alertTitle = "Alert!"
    static let alertOkButton = "OK"
    static let emailEmpty = "Email cannot be empty."
    static let emailInvalid = "Invalid email format."
    static let passwordEmpty = "Password cannot be empty."
    static let passwordInvalidHints = "Password must be at least 8 characters long, including 1 uppercase letter and 1 number."
    
    //Tabbar Title
    static let homeTabTitle = "Home"
    static let cartTabTitle = "Cart"
    static let profileTabTitle = "Profile"
    
    //Address View Title
    static let addressViewTitle = "Adress Update"
    static let firstNameTitle = "First Name"
    static let lastNameTitle = "Last Name"
    static let dorNoTitle = "dorFlatNO"
    static let streetTitle = "street Name"
    static let pincodeTitle = "PinCode"
    
    static let yourOrderTitle = "Your Orders"
    static let yourAddressTitle = "Your Address"
    static let accountSettingTitle = "Account Settings"
    static let editProfileTitle = "Edit Profile"
    static let saveCardTitle = "Saved cards & Wallets"
    static let notificationTitle = "Notification"
    static let contactUsTitle = "Contact Us"
    static let termsAndPolicyTitle = "Terms & Policy"
    static let questionAnswerTitle = "Question & Answer"
    static let emptyCartTitle = "Cart is Empty"
    static let cartNavigationTitle = "Cart"
    static let totalPriceTitle = "Total Price"
    static let buyNowTitle = "Buy Now"
    static let ratingTitle = "Ratings"
    
}

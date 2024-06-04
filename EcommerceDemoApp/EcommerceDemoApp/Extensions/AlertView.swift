//
//  AlertView.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 29/05/24.
//

import SwiftUI

func createAlert(title: String, message: String, primaryButtonTitle: String = "OK", primaryButtonAction: @escaping () -> Void = {}) -> Alert {
    return Alert(
        title: Text(title),
        message: Text(message),
        dismissButton: .default(Text(primaryButtonTitle), action: primaryButtonAction)
    )
}

//
//  Constants.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

// MARK: View Controller IDs

enum ViewControllerIdentifiers: String {
    case HomeVC = "HomeVC"
    case SignInVC = "SignInVC"
    case SignUpVC = "SignUpVC"
    case ForgotPasswordVC = "ForgotPasswordVC"
    case SentEmailVC = "SentEmailVC"
}

// MARK: Table View Cell IDs

enum TableViewCellIdentifiers: String {
    case UserMessagesCell = "UserMessagesCell"
}

// MARK: Constraint Constants

enum ConstraintConstants: Int {
    case titleFromTop = 150
}

// MARK: Color Constants

enum ColorConstants {
    case viewBackgroundColor
    
    var getColor: UIColor {
        switch self {
        case .viewBackgroundColor:
            .white
        }
    }
}

//
//  Extensions.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

// MARK: Navigation Methods

extension UIViewController {
    func navigateToHome(username: String?) {
        let objHomeVC = HomeVC()
        objHomeVC.username = username
        self.navigationController?.pushViewController(objHomeVC, animated: true)
    }
    
    func navigateToSignUp() {
        let objSignUpVC = SignUpVC()
        self.navigationController?.pushViewController(objSignUpVC, animated: true)
    }
    
    func navigateToSignIn() {
        let objSignInVC = SignInVC()
        self.navigationController?.pushViewController(objSignInVC, animated: true)
    }
    
    func navigateToForgotPassword() {
        let objForgotPasswordVC = ForgotPasswordVC()
        self.navigationController?.pushViewController(objForgotPasswordVC, animated: true)
    }
    
    func navigateToSentEmail(email: String?) {
        let objSentEmailVC = SentEmailVC()
        objSentEmailVC.email = email
        self.navigationController?.pushViewController(objSentEmailVC, animated: true)
    }
}

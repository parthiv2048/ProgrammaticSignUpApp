//
//  SignInVC.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/16/26.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: Properties
    
    var titleLabel: UILabel?
    var subtitleLabel: UILabel?
    var usernameTF: UITextField?
    var passwordTF: UITextField?
    var forgotPasswordButton: UIButton?
    var signInButton: UIButton?
    var signUpLink: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSignInScreen()
    }
    
    // MARK: Programmatically Set Up Sign In Screen
    
    func setUpSignInScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Create the Title label telling user to log in
        titleLabel = UILabel()
        titleLabel?.text = "Sign In"
        titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel?.textColor = .black
        titleLabel?.textAlignment = .center
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedTitleLabel = titleLabel {
            view.addSubview(unwrappedTitleLabel)
            
            NSLayoutConstraint.activate([
                unwrappedTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedTitleLabel.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: CGFloat(ConstraintConstants.titleFromTop.rawValue)),
                unwrappedTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        /// Create Subtitle label telling user to enter username and password
        subtitleLabel = UILabel()
        subtitleLabel?.text = "Please enter your Username and Password"
        subtitleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        subtitleLabel?.textColor = .darkGray
        subtitleLabel?.textAlignment = .center
        subtitleLabel?.numberOfLines = 0
        subtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedSubtitleLabel = subtitleLabel {
            view.addSubview(unwrappedSubtitleLabel)
            
            NSLayoutConstraint.activate([
                unwrappedSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSubtitleLabel.topAnchor.constraint(equalTo: titleLabel?.bottomAnchor ?? view.topAnchor, constant: 20),
                unwrappedSubtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSubtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedSubtitleLabel.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
        
        /// Create Username TextField
        usernameTF = UITextField()
        usernameTF?.placeholder = "Username"
        usernameTF?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedUsernameTF = usernameTF {
            view.addSubview(unwrappedUsernameTF)
            
            NSLayoutConstraint.activate([
                unwrappedUsernameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedUsernameTF.topAnchor.constraint(equalTo: subtitleLabel?.bottomAnchor ?? view.topAnchor, constant: 100),
                unwrappedUsernameTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedUsernameTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedUsernameTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Password TextField
        passwordTF = UITextField()
        passwordTF?.placeholder = "Password"
        passwordTF?.textAlignment = .left
        passwordTF?.isSecureTextEntry = true
        passwordTF?.autocapitalizationType = .none
        passwordTF?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedPasswordTF = passwordTF {
            view.addSubview(unwrappedPasswordTF)
            
            NSLayoutConstraint.activate([
                unwrappedPasswordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedPasswordTF.topAnchor.constraint(equalTo: usernameTF?.bottomAnchor ?? view.topAnchor, constant: 30),
                unwrappedPasswordTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedPasswordTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedPasswordTF.widthAnchor.constraint(equalTo: usernameTF?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Forgot Password button
        forgotPasswordButton = UIButton()
        forgotPasswordButton?.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton?.backgroundColor = .white
        forgotPasswordButton?.setTitleColor(.link, for: .normal)
        forgotPasswordButton?.layer.cornerRadius = 8
        forgotPasswordButton?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        forgotPasswordButton?.titleLabel?.textAlignment = .right
        forgotPasswordButton?.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton?.addAction(UIAction {_ in
            self.navigateToForgotPassword()
        }, for: .touchUpInside)
        
        if let unwrappedForgotPasswordButton = forgotPasswordButton {
            view.addSubview(unwrappedForgotPasswordButton)
            
            NSLayoutConstraint.activate([
                unwrappedForgotPasswordButton.topAnchor.constraint(equalTo: passwordTF?.bottomAnchor ?? view.topAnchor, constant: 2),
                unwrappedForgotPasswordButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedForgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTF?.trailingAnchor ?? view.trailingAnchor)
            ])
        }
        
        /// Create Sign In button
        signInButton = UIButton()
        signInButton?.setTitle("Log In", for: .normal)
        signInButton?.backgroundColor = .systemBlue
        signInButton?.layer.cornerRadius = 8
        signInButton?.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton?.addAction(UIAction {_ in
            self.navigateToHome(username: self.usernameTF?.text)
        }, for: .touchUpInside)
        
        if let unwrappedSignInButton = signInButton {
            view.addSubview(unwrappedSignInButton)
            
            NSLayoutConstraint.activate([
                unwrappedSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSignInButton.topAnchor.constraint(equalTo: passwordTF?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSignInButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSignInButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedSignInButton.widthAnchor.constraint(equalTo: usernameTF?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Sign Up Link
        signUpLink = UIButton()
        signUpLink?.setTitle("Dont' have an account? Sign Up", for: .normal)
        signUpLink?.backgroundColor = .white
        signUpLink?.setTitleColor(.link, for: .normal)
        signUpLink?.layer.cornerRadius = 8
        signUpLink?.translatesAutoresizingMaskIntoConstraints = false
        
        signUpLink?.addAction(UIAction {_ in
            self.navigateToSignUp()
        }, for: .touchUpInside)
        
        if let unwrappedSignUpLink = signUpLink {
            view.addSubview(unwrappedSignUpLink)
            
            NSLayoutConstraint.activate([
                unwrappedSignUpLink.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSignUpLink.topAnchor.constraint(equalTo: signInButton?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSignUpLink.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSignUpLink.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            ])
        }
    }
}


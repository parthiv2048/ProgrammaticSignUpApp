//
//  SignUpVC.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: Properties
    
    var titleLabel: UILabel?
    var subtitleLabel: UILabel?
    var usernameTF: UITextField?
    var emailTF: UITextField?
    var passwordTF: UITextField?
    var confirmPasswordTF: UITextField?
    var signUpButton: UIButton?
    var signInLink: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSignUpScreen()
    }
    
    func setUpSignUpScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Create the Title label telling user to log in
        titleLabel = UILabel()
        titleLabel?.text = "Sign Up"
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
        subtitleLabel?.text = "Please enter your Username, Email, and Password"
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
                unwrappedUsernameTF.topAnchor.constraint(equalTo: subtitleLabel?.bottomAnchor ?? view.topAnchor, constant: 80),
                unwrappedUsernameTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedUsernameTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedUsernameTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Email TextField
        emailTF = UITextField()
        emailTF?.placeholder = "Email Address"
        emailTF?.keyboardType = .emailAddress
        emailTF?.textContentType = .emailAddress
        emailTF?.autocapitalizationType = .none
        emailTF?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedEmailTF = emailTF {
            view.addSubview(unwrappedEmailTF)
            
            NSLayoutConstraint.activate([
                unwrappedEmailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedEmailTF.topAnchor.constraint(equalTo: usernameTF?.bottomAnchor ?? view.topAnchor, constant: 30),
                unwrappedEmailTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedEmailTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedEmailTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
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
                unwrappedPasswordTF.topAnchor.constraint(equalTo: emailTF?.bottomAnchor ?? view.topAnchor, constant: 30),
                unwrappedPasswordTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedPasswordTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedPasswordTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Confirm Password TextField
        confirmPasswordTF = UITextField()
        confirmPasswordTF?.placeholder = "Confirm Password"
        confirmPasswordTF?.textAlignment = .left
        confirmPasswordTF?.isSecureTextEntry = true
        confirmPasswordTF?.autocapitalizationType = .none
        confirmPasswordTF?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedConfirmPasswordTF = confirmPasswordTF {
            view.addSubview(unwrappedConfirmPasswordTF)
            
            NSLayoutConstraint.activate([
                unwrappedConfirmPasswordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedConfirmPasswordTF.topAnchor.constraint(equalTo: passwordTF?.bottomAnchor ?? view.topAnchor, constant: 30),
                unwrappedConfirmPasswordTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedConfirmPasswordTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedConfirmPasswordTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Sign Up button
        signUpButton = UIButton()
        signUpButton?.setTitle("Register", for: .normal)
        signUpButton?.backgroundColor = .systemBlue
        signUpButton?.layer.cornerRadius = 8
        signUpButton?.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton?.addAction(UIAction {_ in
            self.navigateToHome(username: self.usernameTF?.text)
        }, for: .touchUpInside)
        
        if let unwrappedSignUpButton = signUpButton {
            view.addSubview(unwrappedSignUpButton)
            
            NSLayoutConstraint.activate([
                unwrappedSignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSignUpButton.topAnchor.constraint(equalTo: confirmPasswordTF?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSignUpButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSignUpButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedSignUpButton.widthAnchor.constraint(equalTo: usernameTF?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Sign Up Link
        signInLink = UIButton()
        signInLink?.setTitle("Already have an account? Sign In", for: .normal)
        signInLink?.backgroundColor = .white
        signInLink?.setTitleColor(.link, for: .normal)
        signInLink?.layer.cornerRadius = 8
        signInLink?.translatesAutoresizingMaskIntoConstraints = false
        
        signInLink?.addAction(UIAction {_ in
            self.navigateToSignIn()
        }, for: .touchUpInside)
        
        if let unwrappedSignInLink = signInLink {
            view.addSubview(unwrappedSignInLink)
            
            NSLayoutConstraint.activate([
                unwrappedSignInLink.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSignInLink.topAnchor.constraint(equalTo: signUpButton?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSignInLink.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSignInLink.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            ])
        }
    }
}

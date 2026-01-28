//
//  ForgotPasswordVC.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    // MARK: Properties
    
    var titleLabel: UILabel?
    var subtitleLabel: UILabel?
    var emailTF: UITextField?
    var sendEmailButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpForgotPasswordScreen()
    }
    
    // MARK: Programmatically Set Up Forgot Password Screen
    
    func setUpForgotPasswordScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Create the Title label for Forgot Password Screen
        titleLabel = UILabel()
        titleLabel?.text = "Forgot Password"
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
        
        /// Create Subtitle label telling user to enter email
        subtitleLabel = UILabel()
        subtitleLabel?.text = "A code will be sent to your email"
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
        
        /// Create Email Text Field
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
                unwrappedEmailTF.topAnchor.constraint(equalTo: subtitleLabel?.bottomAnchor ?? view.topAnchor, constant: 100),
                unwrappedEmailTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedEmailTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedEmailTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Send Email button
        sendEmailButton = UIButton()
        sendEmailButton?.setTitle("Send Code", for: .normal)
        sendEmailButton?.backgroundColor = .systemBlue
        sendEmailButton?.layer.cornerRadius = 8
        sendEmailButton?.translatesAutoresizingMaskIntoConstraints = false
        
        sendEmailButton?.addAction(UIAction {_ in
            self.navigateToSentEmail(email: self.emailTF?.text)
        }, for: .touchUpInside)
        
        if let unwrappedSendEmailButton = sendEmailButton {
            view.addSubview(unwrappedSendEmailButton)
            
            NSLayoutConstraint.activate([
                unwrappedSendEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSendEmailButton.topAnchor.constraint(equalTo: emailTF?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSendEmailButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSendEmailButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedSendEmailButton.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
    }

}

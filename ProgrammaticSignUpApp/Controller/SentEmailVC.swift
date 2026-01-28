//
//  SentEmailVC.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

class SentEmailVC: UIViewController {
    
    // MARK: Properties
    
    var email: String?
    
    var titleLabel: UILabel?
    var subtitleLabel: UILabel?
    var codeTF: UITextField?
    var submitCodeButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSentEmailScreen()
    }
    
    // MARK: Programmatically Set Up Sent Email Screen
    
    func setUpSentEmailScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Create the Title label for Sent Email Screen
        titleLabel = UILabel()
        titleLabel?.text = "Sent Email"
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
        subtitleLabel?.text = "We've sent a code to your email: \(email ?? "")"
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
        codeTF = UITextField()
        codeTF?.placeholder = "Enter Code"
        codeTF?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedCodeTF = codeTF {
            view.addSubview(unwrappedCodeTF)
            
            NSLayoutConstraint.activate([
                unwrappedCodeTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedCodeTF.topAnchor.constraint(equalTo: subtitleLabel?.bottomAnchor ?? view.topAnchor, constant: 100),
                unwrappedCodeTF.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedCodeTF.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedCodeTF.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
        
        /// Create Submit Code button
        submitCodeButton = UIButton()
        submitCodeButton?.setTitle("Send Code", for: .normal)
        submitCodeButton?.backgroundColor = .systemBlue
        submitCodeButton?.layer.cornerRadius = 8
        submitCodeButton?.translatesAutoresizingMaskIntoConstraints = false
        
        submitCodeButton?.addAction(UIAction {_ in
            self.navigateToSignIn()
        }, for: .touchUpInside)
        
        if let unwrappedSubmitCodeButton = submitCodeButton {
            view.addSubview(unwrappedSubmitCodeButton)
            
            NSLayoutConstraint.activate([
                unwrappedSubmitCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedSubmitCodeButton.topAnchor.constraint(equalTo: codeTF?.bottomAnchor ?? view.topAnchor, constant: 50),
                unwrappedSubmitCodeButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedSubmitCodeButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
                unwrappedSubmitCodeButton.widthAnchor.constraint(equalTo: subtitleLabel?.widthAnchor ?? view.widthAnchor)
            ])
        }
    }

}

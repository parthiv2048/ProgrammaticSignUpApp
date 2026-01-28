//
//  HomeVC.swift
//  ProgrammaticSignUpApp
//
//  Created by Parthiv Ganguly on 1/27/26.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: Properties
    
    var username: String?
    var greetingLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHomeScreen()
    }
    
    func setUpHomeScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Create the Greeting label to tell Hi to username
        greetingLabel = UILabel()
        greetingLabel?.text = "Hi, \(username ?? "")!"
        greetingLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        greetingLabel?.textColor = .black
        greetingLabel?.textAlignment = .center
        greetingLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedGreetingLabel = greetingLabel {
            view.addSubview(unwrappedGreetingLabel)
            
            NSLayoutConstraint.activate([
                unwrappedGreetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                unwrappedGreetingLabel.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: CGFloat(ConstraintConstants.titleFromTop.rawValue)),
                unwrappedGreetingLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                unwrappedGreetingLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
            ])
        }
    }

}

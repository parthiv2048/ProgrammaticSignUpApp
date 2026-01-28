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
    var tableView: UITableView?
    var messages: [UserMessageData]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHomeScreen()
    }
    
    func setUpHomeScreen() {
        /// Set View Background Color
        view.backgroundColor = ColorConstants.viewBackgroundColor.getColor
        
        /// Get User Messages (Mock Data)
        messages = UserMessageData.generateMockData()
        
        /// Create the Table View
        tableView = UITableView()
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellIdentifiers.UserMessagesCell.rawValue)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let unwrappedTableView = tableView {
            view.addSubview(unwrappedTableView)
            
            NSLayoutConstraint.activate([
                unwrappedTableView.topAnchor.constraint(equalTo: view.topAnchor),
                unwrappedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                unwrappedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                unwrappedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
}

// MARK: Table View Data Source
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.UserMessagesCell.rawValue) else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = messages?[indexPath.row].messageText ?? ""
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: Table View Delegate

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        /// Create the Greeting label to tell Hi to username
        greetingLabel = UILabel()
        greetingLabel?.text = "Hi, \(username ?? "")!"
        greetingLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        greetingLabel?.textColor = .black
        greetingLabel?.textAlignment = .center
        greetingLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        if let greetingLabel = greetingLabel {
            headerView.addSubview(greetingLabel)
            
            NSLayoutConstraint.activate([
                greetingLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
            ])
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //referencing the value
        let selectedItem = messages?[indexPath.row]
        selectedItem?.messageSelected.toggle()
        selectedItem?.messageText = (selectedItem?.messageSelected ?? false) ? "View Message \(indexPath.row + 1)?" : "Message \(indexPath.row + 1)"
        self.tableView?.reloadRows(at: [indexPath], with: .none)

    }
}

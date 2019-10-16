//
//  ContactsViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var contactsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
    }
    
    private func configureTableView() {
        contactsTableView = UITableView()
        view.addSubview(contactsTableView)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactsCell")
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    @objc private func addButtonPressed() {
        performSegue(withIdentifier: "addContact", sender: nil)
    }

}


extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        cell.textLabel?.text = "roma"
        return cell
    }
    
    
}

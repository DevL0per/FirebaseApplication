//
//  ContactsViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit
import Firebase

class ContactsViewController: UIViewController {
    
    var contactsTableView: UITableView!
    private var user: User!
    private var ref: DatabaseReference!
    private var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
        createUser()
    }
    
    private func createUser() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(user.userId).child("contacts")
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
        
        title = "Contacts"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7450980544, green: 0.2126455816, blue: 0.1617561306, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "sign out", style: .plain, target: self, action: #selector(signOut))
    }
    
    @objc private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error)
        }
         dismiss(animated: true, completion: nil)
    }
    
    @objc private func addButtonPressed() {
        performSegue(withIdentifier: "addContact", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CreateContactViewController
        vc.user = user
        vc.ref = ref
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

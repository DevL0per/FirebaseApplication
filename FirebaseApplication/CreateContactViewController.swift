//
//  CreateContactViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController, UIAdaptivePresentationControllerDelegate {

    private var navigationBar: UINavigationBar!
    private var firstNameTextField = UITextField()
    private var secondNameTextField  = UITextField()
    
    private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureStackView()
        presentationController?.delegate = self
        
    }
    
    
    private func configureStackView() {
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(secondNameTextField)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        configureTextField(textField: firstNameTextField)
        configureTextField(textField: secondNameTextField)
        
        firstNameTextField.placeholder = "first name"
        secondNameTextField.placeholder = "second name"
        
    }
    
    private func configureTextField(textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.leftView = spaceView
        
    }
    
    private func configureNavigationBar() {
        navigationBar = UINavigationBar()
        view.addSubview(navigationBar)
        let titleItem = UINavigationItem(title: "New Contact")
        navigationBar.setItems([titleItem], animated: false)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print(#function)
    }

}

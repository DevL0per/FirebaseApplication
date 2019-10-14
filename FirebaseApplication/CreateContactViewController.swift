//
//  CreateContactViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController {

    private var navigationBar: UINavigationBar!
    private var firstNameTextField = UITextField()
    private var secondNameTextField  = UITextField()
    
    private var doneButton: UIBarButtonItem!
    
    private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureStackView()
        presentationController?.delegate = self
        
        firstNameTextField.addTarget(self, action: #selector(firstNameTextFieldTarget), for: .editingChanged)
        
    }
    
    @objc private func firstNameTextFieldTarget() {
        guard let text = firstNameTextField.text else { return }
        isModalInPresentation = text.isEmpty ? false : true
        doneButton.isEnabled = text.isEmpty ? false : true
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
        let navigationItem = UINavigationItem(title: "New Contact")
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.rightBarButtonItem = doneButton
        navigationBar.setItems([navigationItem], animated: false)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
    
    @objc private func doneButtonPressed() {
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Choose what to do",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save Contact",
                                       style: .default,
                                       handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        let exitAcntion = UIAlertAction(title: "Exit without saving",
                                        style: .destructive,
                                        handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addAction(exitAcntion)
        present(alert, animated: true)
    }

}

extension CreateContactViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        showAlert()
    }
}

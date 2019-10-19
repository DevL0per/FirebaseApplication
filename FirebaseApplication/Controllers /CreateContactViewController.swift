//
//  CreateContactViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit
import Firebase

class CreateContactViewController: UIViewController {

    var user: User!
    var ref: DatabaseReference!
    
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
        
        secondNameTextField.addTarget(self, action: #selector(checkTextFields), for: .editingChanged)
        firstNameTextField.addTarget(self, action: #selector(checkTextFields), for: .editingChanged)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc private func checkTextFields() {
        guard let name = firstNameTextField.text, let surname = secondNameTextField.text
            else { return }
        isModalInPresentation = (!name.isEmpty && !surname.isEmpty) ? true : false
        doneButton.isEnabled = (!name.isEmpty && !surname.isEmpty) ? true : false
    }
    
    @objc private func doneButtonPressed() {
        saveContent()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Choose what to do",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save Contact",
                                       style: .default,
                                       handler: { [weak self] (_) in
            self?.saveContent()
            })
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        let exitAcntion = UIAlertAction(title: "Exit without saving",
                                        style: .destructive,
                                        handler: { [weak self] (_) in
          self?.dismiss(animated: true, completion: nil)
        })
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addAction(exitAcntion)
        present(alert, animated: true)
    }
    
    private func saveContent() {
        let contact = Contact(userId: user.userId,
                          name: firstNameTextField.text!,
                          surname: secondNameTextField.text!)
        let contactRef = ref.child(String(contact.contactId))
        contactRef.setValue(contact.convertToDictionary())
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK - configures
    
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
        
    }
    
    private func configureTextField(textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        textField.delegate = self
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.leftView = spaceView
        
        if textField == firstNameTextField {
            textField.placeholder = "first name"
            textField.returnKeyType = .next
        } else {
            textField.placeholder = "second name"
        }
        
    }
    
    private func configureNavigationBar() {
        navigationBar = UINavigationBar()
        view.addSubview(navigationBar)
        let navigationItem = UINavigationItem(title: "New Contact")
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.rightBarButtonItem = doneButton
        doneButton.isEnabled = false
        navigationBar.setItems([navigationItem], animated: false)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
}

extension CreateContactViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        showAlert()
    }
}


extension CreateContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == firstNameTextField {
            secondNameTextField.becomeFirstResponder()
        }
        return true
    }
}

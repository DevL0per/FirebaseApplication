//
//  LoginViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 16/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private var mainStackView: UIStackView!
    
    private var loginTextField = UITextField()
    private var passwordTextField = UITextField()
    private var userMessageLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.textColor = #colorLiteral(red: 0.7450980544, green: 0.2126455816, blue: 0.1617561306, alpha: 1)
        label.text = " "
        return label
    }()
    
    private var registrationButton: UIButton!
    private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //Configure textFields
        configureTextField(textField: loginTextField)
        configureTextField(textField: passwordTextField)
        
        configureLoginButton()
        configureRegistrationButton()
        
        configureStackView()
        
    }
    
    //MARK: - Configures
    
    private func configureLoginButton() {
        loginButton = UIButton()
        loginButton.layer.cornerRadius = 3
        loginButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.2126455816, blue: 0.1617561306, alpha: 1)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.setTitle(" Login ", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTarget), for: .touchUpInside)
    }
    
    func showWarningLabel(text: String) {
        userMessageLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            [weak self] in
            self?.userMessageLabel.alpha = 1
        }) { [weak self] (_) in
            self?.userMessageLabel.alpha = 0
        }
    }
    
    @objc private func loginButtonTarget() {
        guard let email = loginTextField.text, let password = passwordTextField.text,
            !email.isEmpty, !password.isEmpty else {
                showWarningLabel(text: "incorrect data")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.showWarningLabel(text: "authorization error")
            } else if user != nil {
                self.performSegue(withIdentifier: "noteSegue", sender: nil)
                return
            }
            self.showWarningLabel(text: "User doesn't exist")
        }
    }
    
    private func configureRegistrationButton() {
        registrationButton = UIButton()
        registrationButton.backgroundColor = .clear
        registrationButton.setTitle("Registration", for: .normal)
        registrationButton.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.2126455816, blue: 0.1617561306, alpha: 1), for: .normal)
        registrationButton.addTarget(self, action: #selector(RegistrationButtonTarget), for: .touchUpInside)
    }
    
    @objc private func RegistrationButtonTarget() {
        
    }
    
    private func configureTextField(textField: UITextField) {
        //textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        textField.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
        textField.leftViewMode = .always
        
        let lefrview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftView = lefrview
        
        if textField == loginTextField {
            textField.placeholder = "Enter e-mail"
        } else {
            textField.placeholder = "Enter password"
        }
    }
    
    
    //MARK: - Set Constraints
    private func configureStackView() {
        
        //Configure mainStackView
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 20
        
        //Configure textFieldsStackView for LoginTextField and PasswordTextField
        let textFieldsStackView = UIStackView()
        textFieldsStackView.axis = .vertical
        textFieldsStackView.alignment = .center
        textFieldsStackView.spacing = 15
        textFieldsStackView.addArrangedSubview(loginTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        
        //Set constraints to loginTextField
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.rightAnchor.constraint(equalTo: textFieldsStackView.rightAnchor).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: textFieldsStackView.leftAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Set constraints to passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.rightAnchor.constraint(equalTo: textFieldsStackView.rightAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: textFieldsStackView.leftAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Add elements to mainStackView
        mainStackView.addArrangedSubview(userMessageLabel)
        mainStackView.addArrangedSubview(textFieldsStackView)
        
        view.addSubview(mainStackView)
        
        //Set Constraints to mainStackView
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        //Set Constraints to textFieldsStackView
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.leftAnchor.constraint(equalTo: mainStackView.leftAnchor).isActive = true
        textFieldsStackView.rightAnchor.constraint(equalTo: mainStackView.rightAnchor).isActive = true
        
        //Configure buttonsStackView
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 10
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(registrationButton)
        
        //Set constraints to buttonsStackView
        view.addSubview(buttonsStackView)
        buttonsStackView.backgroundColor = .red
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        buttonsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        //Set constraints to loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leftAnchor.constraint(equalTo: buttonsStackView.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: buttonsStackView.rightAnchor).isActive = true
    }
    
}

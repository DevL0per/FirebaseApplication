//
//  RegistrationViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 14/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    private var backgroundImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        return imageView
    }()
    private var mainStackView: UIStackView!
    
    private var loginTextField = UITextField()
    private var passwordTextField = UITextField()
    private var userMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "User doesn't exist"
        label.textColor = .red
        return label
    }()
    
    private var registrationButton: UIButton!
    private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        loginButton.backgroundColor = #colorLiteral(red: 0.6935080901, green: 0.6935080901, blue: 0.6935080901, alpha: 0.8040079195)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.setTitle(" Login ", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTarget), for: .touchUpInside)
    }
    
    @objc private func loginButtonTarget() {
        performSegue(withIdentifier: "toNoteController", sender: nil)
    }
    
    private func configureRegistrationButton() {
        registrationButton = UIButton()
        registrationButton.backgroundColor = .clear
        registrationButton.setTitle("Registration", for: .normal)
        registrationButton.addTarget(self, action: #selector(RegistrationButtonTarget), for: .touchUpInside)
    }
    
    @objc private func RegistrationButtonTarget() {
        
    }
    
    private func configureTextField(textField: UITextField) {
        //textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.text = "fdgfdggf"
    }
    
    
    //MARK: - Set Constraints
    private func configureStackView() {
        
        view.addSubview(backgroundImage)
        
        //Set constraints to backgroundImage
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
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
        
        //Set constraints to passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.rightAnchor.constraint(equalTo: textFieldsStackView.rightAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: textFieldsStackView.leftAnchor).isActive = true
        
        //Add elements to mainStackView
        mainStackView.addArrangedSubview(userMessageLabel)
        mainStackView.addArrangedSubview(textFieldsStackView)
        
        view.addSubview(mainStackView)
        
        //Set Constraints to mainStackView
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 40).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -40).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
        
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
        buttonsStackView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -20).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 85).isActive = true
        buttonsStackView.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -85).isActive = true
        
        //Set constraints to loginButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leftAnchor.constraint(equalTo: buttonsStackView.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: buttonsStackView.rightAnchor).isActive = true
        
    }
    

}


//
//  Extension+LoginViewController.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 19/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
    
    
    
}

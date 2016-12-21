//
//  ViewController.swift
//  EasyKeyboard
//
//  Created by DA SILVA Andre Henrique on 21/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class ViewController: EasyKeyboardViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        
        signIn()
    }
    
    func signIn() {
        
        view.endEditing(true)
        
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextfield {
            
            passwordTextfield.becomeFirstResponder()
            
        } else {

            signIn()
        }
        
        return true
    }
}


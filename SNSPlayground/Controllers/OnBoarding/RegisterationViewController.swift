//
//  RegisterationViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//

import UIKit

class RegisterationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var CreatAccountButton: UIButton!
    
    @IBAction func tapCreateAccount(_ sender: UIButton) {
        
        guard checkValid() else { return }
        createAccount()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordField.delegate = self
        nameField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func checkValid() -> Bool{
        //TODO: chcck vaild in realtime
        
        guard let email = emailTextField.text, !email.isEmpty else {
            stateLabel.text = "please enter an email"
            return false
        }
        
        guard let password = passwordField.text, password.count > 7 else {
            stateLabel.text = "Please enter a password with at least 8 digits"
            return false
            
        }
        
        guard let name = nameField.text, !name.isEmpty else {
            stateLabel.text = "please enter a name"
            return false
        }
        stateLabel.text = ""
        return true
    }
    
    
    func createAccount(){
        
        guard let email = emailTextField.text, let userName = nameField.text, let password = passwordField.text else {
            return
        }

        AuthManager.shared.registerNewUser(email: email, userName: userName, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {})
                } else {
                    //TODO: Error handliing
                    let alert = UIAlertController(title: "Error", message: "some error occured", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                }
            }

        }
    }
}


extension RegisterationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            nameField.becomeFirstResponder()
        }else if textField == nameField {
            guard let email = emailTextField.text, let password = passwordField.text else { return true }
            
            if !email.isEmpty && !password.isEmpty {
                //TODO: Create Account
                view.endEditing(true)
            }
            
        }
        
        return true
    }
    
}

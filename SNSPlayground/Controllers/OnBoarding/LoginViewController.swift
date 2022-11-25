//
//  LoginViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//

import UIKit

class LoginViewController: UIViewController {

  
   
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var emailOrUserNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        //check auth
        checkAuth()
    }
    
    @IBAction func createNewAccountTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "RegisterationViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterationViewController")
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailOrUserNameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func checkAuth() {
        var userName: String? = nil
        var userEmail: String? = nil
        
        guard let emailOrUserName = emailOrUserNameTextField.text, !emailOrUserName.isEmpty else {
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty, password.count > 7 else {
            return
        }
        view.endEditing(true)
        
        
        if emailOrUserName.contains("@") && emailOrUserName.contains(".") {
            userEmail = emailOrUserName
        }else{
            userName = emailOrUserName
        }
        
        AuthManager.shared.loginUser(userName: userName, email: userEmail, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true)
                }else {
                    //TODO: ERROR Handling
                    let alert = UIAlertController(title: "Log In Error", message: "we were unable to log you in.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                }
            }
            
        }
    }
   

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailOrUserNameTextField {
            passwordTextField.becomeFirstResponder()
        }else {
            checkAuth()
        }
        return true
    }
    
}


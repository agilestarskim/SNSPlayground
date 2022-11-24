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
    
    @IBOutlet weak var stackViewConstraintsCenterY: NSLayoutConstraint!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        //check auth
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
     }
    override func viewWillDisappear(_ animated: Bool)
    {
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc func keyBoardWillShow(notification: NSNotification) {
        //TODO: 키보드 레이아웃 고려
        stackViewConstraintsCenterY.constant = -100
    }

    @objc func keyBoardWillHide(notification: NSNotification) {
        stackViewConstraintsCenterY.constant = 0
    }
    
   

}



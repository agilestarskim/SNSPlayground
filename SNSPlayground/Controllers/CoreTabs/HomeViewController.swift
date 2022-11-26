//
//  HomeViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticate()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    
    func handleNotAuthenticate() {
        if Auth.auth().currentUser == nil {
            //show Login View
            let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
            
        }
    }

}

//
//  ProfileViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//

import UIKit

class ProfileViewController: UIViewController, OptionDelegate {
    
    func selectOption(option: String) {
        if option == "Settings" {
            pushSettings()
        }
    }
    
    
    let optionModalViewController = OptionModalViewController()
    
    @IBOutlet weak var nickName: UIBarButtonItem!
    
    @IBAction func tapEditProfile() {
        let storyboard = UIStoryboard(name: "EditProfileViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    
    @IBAction func tapOptionButton(_ sender: UIBarButtonItem) {
        let vc = optionModalViewController
        present(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        optionModalViewController.delegate = self
        // Do any additional setup after loading the view.

    }
    
    func pushSettings() {
        let storyboard = UIStoryboard(name: "SettingsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings")
        vc.title = "Settings"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

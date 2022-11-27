//
//  SettingsNavigationController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/26.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let label = ["Follow and invite Friends", "Notifications", "Privacy", "Supervision", "Security", "Ads", "Account", "Help", "About"]
    
    let icon = ["person.badge.plus", "bell", "lock", "person.2", "checkmark.shield", "megaphone", "person.crop.circle", "questionmark.circle", "info.circle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapLogout() {
        let alert = UIAlertController(title: "Log out", message: "log out of nickname", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Log out", style: .destructive){ _ in
            AuthManager.shared.logoutUser { success in
                DispatchQueue.main.async {
                    if success {
                        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
                        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true)
                        self.navigationController?.popToRootViewController(animated: true)
                        self.tabBarController?.selectedIndex = 0
                    }else {
                        print("error")
                    }
                }
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    
  
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SettingsTableCell else {
            return UITableViewCell()
        }
    
        cell.title.text = label[indexPath.row]
        cell.icon.image = UIImage(systemName: icon[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}

class SettingsTableCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
}

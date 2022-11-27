//
//  EditProfileViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/27.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    let item = ["Name", "Username", "Pronouns", "Bio", "Links"]
    let data = ["Minseong Kim", "mm", "pronouns", "hello world!", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func tapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tapEditPicture() {
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableCell", for: indexPath) as? EditTableCell else {
            return UITableViewCell()
        }
        
        cell.item.text = item[indexPath.row]
        cell.data.text = item[indexPath.row]
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class EditTableCell: UITableViewCell {
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var data: UILabel!
}

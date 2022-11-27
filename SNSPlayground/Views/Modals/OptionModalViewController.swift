//
//  SettingModalViewController.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/26.
//

import UIKit

protocol OptionDelegate: AnyObject{
    func selectOption(option: String)
}

class OptionModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let label = ["Settings", "Your activity", "Archive", "QR code", "Saved", "Digital collectibles", "Close Friends", "Favorites"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label.count
    }
    
    weak var delegate: OptionDelegate?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        // Configure content.
        content.attributedText = NSAttributedString(string: label[indexPath.row], attributes: [
            .font: UIFont.systemFont(ofSize: 17, weight: .regular),
        ])
        content.directionalLayoutMargins.top = 15
        content.directionalLayoutMargins.bottom = 15
        content.directionalLayoutMargins.trailing = 30
        content.directionalLayoutMargins.leading = 30
        
        // Customize appearance.

        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
        delegate?.selectOption(option: label[indexPath.row])
        
    }
    
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

//
//  SettingsViewController.swift
//  KBTUApp
//
//  Created by Adilet Absatov on 10.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    var isAdmin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
    }
    
    @IBAction func switchAdmin(_ sender: UISwitch) {
        let navcon = self.tabBarController?.viewControllers?[0] as! UINavigationController
        let news = navcon.visibleViewController as? NewsViewController
        news?.addButton.isEnabled = sender.isOn
    }
}

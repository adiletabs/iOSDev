//
//  BrowserVC.swift
//  Browser
//
//  Created by Adilet Absatov on 25.02.2021.
//

import UIKit

class BrowserVC: UITableViewController {
    private var browserModel = BrowserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Websites"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        browserModel.getWebsitesListLength()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return browserModel.getCell(tableView, indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (tableView.indexPathForSelectedRow?.row)!
        if segue.identifier == "showWebsite" {
            if let navcon = segue.destination as? UINavigationController {
                if let destination = navcon.visibleViewController as? WebsiteViewController {
                    browserModel.prepareDestination(destination, index)
                    destination.browserModel = browserModel
                }
            }
        }
    }
    
    @IBAction func callAlertDialog(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add website", message: "All fields are required", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Title"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "URL"
        })
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] action in
            let title = alert.textFields?.first?.text
            let link = alert.textFields?[1].text
            browserModel.addWebsite(title!, link!)
            tableView.reloadData()
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func showList(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0 ? browserModel.showAll() : browserModel.showFavourites()
        tableView.reloadData()
    }
}

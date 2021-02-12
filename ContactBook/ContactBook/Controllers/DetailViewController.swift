//
//  DetailViewController.swift
//  ContactBook
//
//  Created by Adilet Absatov on 12.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    private var contactListModel = ContactListModel()
    
    var contactId: Int?
    var contactList: ContactListModel?
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contactListModel.getContact(contactId!) {
            contactName.text = contact.nameSurname
            contactPhoneNumber.text = contact.phoneNumber
            contactImage.image = contact.image
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteContact(_ sender: UIButton) {
        contactList?.removeContact(contactId!)
        self.navigationController?.popViewController(animated: true)
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

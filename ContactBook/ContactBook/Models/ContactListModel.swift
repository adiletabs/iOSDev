//
//  ContactListModel.swift
//  ContactBook
//
//  Created by Adilet Absatov on 12.02.2021.
//

import Foundation
import UIKit

class ContactListModel {
    private var contacts: [Contact] = [
        Contact.init("Zayn Malik", "+77019798073", UIImage.init(named: "male")!),
        Contact.init("Gigi Hadid", "+15613624318", UIImage.init(named: "female")!),
    ]
    
    func getContactListLength() -> Int {
        return contacts.count
    }
    
    func getCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = contacts[indexPath.row].nameSurname
        cell?.contactPhoneNumber.text = contacts[indexPath.row].phoneNumber
        cell?.contactImageView.image = contacts[indexPath.row].image
        return cell!
    }
    
    func prepareDestination(_ destination: DetailViewController, _ index: Int) {
        destination.contactId = index
    }
    
    func getContact(_ index: Int) -> Contact? {
        if contacts.count > index {
            return contacts[index]
        }
        return nil
    }
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
    
    func removeContact(_ index: Int) {
        contacts.remove(at: index)
    }
}

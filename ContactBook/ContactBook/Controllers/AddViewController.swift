//
//  AddViewController.swift
//  ContactBook
//
//  Created by Adilet Absatov on 12.02.2021.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var nameSurname: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    
    private var genders: [String] = ["Male", "Female"]
    
    var contactList: ContactListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gender.dataSource = self
        gender.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if nameSurname.text != "", phoneNumber.text != "" {
            let pickedGender: String = genders[gender.selectedRow(inComponent: 0)].lowercased()
            let name: String = nameSurname.text!
            let phone: String = phoneNumber.text!
            let newContact: Contact = Contact.init(name, phone, UIImage.init(named: pickedGender)!)
            contactList?.addContact(contact: newContact)
            self.navigationController?.popViewController(animated: true)
        }
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

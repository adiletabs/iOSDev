//
//  Contact.swift
//  ContactBook
//
//  Created by Adilet Absatov on 12.02.2021.
//

import Foundation
import UIKit

class Contact {
    var nameSurname: String?
    var phoneNumber: String?
    var image: UIImage?
    
    init(_ nameSurname: String, _ phoneNumber: String, _ image: UIImage) {
        self.nameSurname = nameSurname
        self.phoneNumber = phoneNumber
        self.image = image
    }
}

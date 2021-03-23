//
//  News.swift
//  KBTUApp
//
//  Created by Adilet Absatov on 09.03.2021.
//

import Foundation
import UIKit

class News {
    var title: String?
    var text: String?
    var image: UIImage?
    var date: Date?
    
    init(_ title: String, _ text: String, _ image: UIImage, _ date: Date) {
        self.title = title
        self.text = text
        self.image = image
        self.date = date
    }
}

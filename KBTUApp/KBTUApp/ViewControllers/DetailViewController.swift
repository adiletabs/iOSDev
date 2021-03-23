//
//  DetailViewController.swift
//  KBTUApp
//
//  Created by Adilet Absatov on 09.03.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDate: UILabel!
    
    var titlePreload: String?
    var textPreload: String?
    var imagePreload: UIImage?
    var datePreload: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = titlePreload
        newsText.text = textPreload
        newsImage.image = imagePreload
        newsDate.text = datePreload
    }
}

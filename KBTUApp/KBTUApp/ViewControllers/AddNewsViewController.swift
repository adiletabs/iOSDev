//
//  AddNewsViewController.swift
//  KBTUApp
//
//  Created by Adilet Absatov on 09.03.2021.
//

import UIKit

protocol AddNews {
    func addNews(_ title: String, _ text: String, _ image: UIImage)
}

class AddNewsViewController: UIViewController {
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var textInput: UITextView!
    @IBOutlet weak var imageInput: UITextField!
    
    var delegate: AddNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Publish news"
        textInput.layer.borderWidth = 0.5
        textInput.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func publishPressed(_ sender: UIButton) {
        if titleInput.text != "" && textInput.text != "" && imageInput.text != "" {
            if let image = UIImage(named: imageInput.text!) {
                delegate?.addNews(titleInput.text!, textInput.text!, image)
                self.dismiss(animated: true, completion: nil)
            } else {
                showAlert("There is no image with that name")
            }
        } else {
            showAlert("All fields are required")
        }
    }
    
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

//
//  EditViewController.swift
//  Map
//
//  Created by Adilet Absatov on 25.03.2021.
//

import UIKit
import MapKit

protocol EditDelegate {
    func removeBlurredBackgroundView()
}

class EditViewController: UIViewController {
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var subtitleInput: UITextField!
    
    var pin: MKPointAnnotation?
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Edit"
        titleInput.text = pin!.title
        subtitleInput.text = pin!.subtitle
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor.clear
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        delegate?.removeBlurredBackgroundView()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        pin!.title = titleInput.text
        pin!.subtitle = subtitleInput.text
        delegate?.removeBlurredBackgroundView()
        self.dismiss(animated: true, completion: nil)
    }
}

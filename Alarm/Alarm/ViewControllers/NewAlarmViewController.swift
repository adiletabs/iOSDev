//
//  AddViewController.swift
//  Alarm
//
//  Created by Adilet Absatov on 12.03.2021.
//

import UIKit

protocol AddAlarm {
    func addAlarm(_ time: String, _ note: String)
}

class NewAlarmViewController: UIViewController {
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var delegate: AddAlarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New alarm"
    }
    
    func changeFormat(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let result = dateFormatter.string(from: date)
        return result
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if note.text != "" {
            let time = changeFormat(timePicker.date)
            delegate?.addAlarm(time, note.text!)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

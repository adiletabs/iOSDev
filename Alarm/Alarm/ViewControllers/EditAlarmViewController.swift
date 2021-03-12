//
//  EditAlarmViewController.swift
//  Alarm
//
//  Created by Adilet Absatov on 12.03.2021.
//

import UIKit

protocol ChangeAlarm {
    func changeAlarm(_ index: Int, _ time: String, _ note: String)
}

protocol DeleteAlarm {
    func deleteAlarm(_ index: Int)
}

class EditAlarmViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var time: UIPickerView!
    
    var changeDelegate: ChangeAlarm?
    var deleteDelegate: DeleteAlarm?
    
    var alarmIndex: Int?
    var timeValue: String?
    var noteValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time.dataSource = self
        time.delegate = self
        note.text = noteValue!
        let hour = Int(timeValue!.prefix(2))!
        let minute = Int(timeValue!.suffix(2))!
        time.selectRow(hour, inComponent: 0, animated: true)
        time.selectRow(minute, inComponent: 1, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        component == 0 ? 24 : 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var result: String = String(row)
        if result.count == 1 {
            result = "0" + result
        }
        return result
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        deleteDelegate?.deleteAlarm(alarmIndex!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changePressed(_ sender: UIButton) {
        if note.text != "" {
            var hour: String = String(time.selectedRow(inComponent: 0))
            var minute: String = String(time.selectedRow(inComponent: 1))
            if hour.count == 1 {
                hour = "0" + hour
            }
            if minute.count == 1 {
                minute = "0" + minute
            }
            let time = hour + ":" + minute
            changeDelegate?.changeAlarm(alarmIndex!, time, note.text!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

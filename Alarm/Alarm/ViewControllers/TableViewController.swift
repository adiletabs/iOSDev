//
//  AlarmViewController.swift
//  Alarm
//
//  Created by Adilet Absatov on 12.03.2021.
//

import UIKit

class TableViewController: UITableViewController, AddAlarm, ChangeAlarm, DeleteAlarm {
    private var alarms: [Alarm] = [
        Alarm.init("20:30", "Take a break"),
        Alarm.init("23:20", "Upload midterm"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Alarms"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        cell?.displayTime.text = alarms[indexPath.row].time
        cell?.note.text = alarms[indexPath.row].note
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            deleteAlarm(indexPath.row)
            tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            if let navcon = segue.destination as? UINavigationController {
                if let destination = navcon.visibleViewController as? NewAlarmViewController {
                    destination.delegate = self
                }
            }
        } else if let destination = segue.destination as? EditAlarmViewController {
            let index = (tableView.indexPathForSelectedRow?.row)!
            destination.changeDelegate = self
            destination.deleteDelegate = self
            destination.alarmIndex = index
            destination.noteValue = alarms[index].note
            destination.timeValue = alarms[index].time
        }
    }
    
    func addAlarm(_ time: String, _ note: String) {
        let newAlarm: Alarm = Alarm.init(time, note)
        alarms.append(newAlarm)
        tableView.reloadData()
    }
    
    func changeAlarm(_ index: Int, _ time: String, _ note: String) {
        alarms[index].time = time
        alarms[index].note = note
        tableView.reloadData()
    }
    
    func deleteAlarm(_ index: Int) {
        alarms.remove(at: index)
        tableView.reloadData()
    }
}

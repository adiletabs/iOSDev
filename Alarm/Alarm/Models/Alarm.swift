//
//  Alarm.swift
//  Alarm
//
//  Created by Adilet Absatov on 12.03.2021.
//

import Foundation

class Alarm {
    var time: String?
    var note: String?
    
    init(_ time: String, _ note: String) {
        self.time = time
        self.note = note
    }
}

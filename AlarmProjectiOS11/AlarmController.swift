//
//  AlarmController.swift
//  AlarmProjectiOS11
//
//  Created by Clay Mills on 2/13/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation

// Controller Basics #1
class AlarmController {
    // Controller Basics #6
    static let sharedInstance = AlarmController()
    // Controller Basics #2
    var alarms: [Alarm] = []
    init() {
        // Controller staged data #1
        var mockAlarms: [Alarm] {
            let alarm1 = Alarm(fireTimeFromMidnight: 3, name: "300 seconds")
            let alarm2 = Alarm(fireTimeFromMidnight: 5, name: "500 seconds")
            return [alarm1, alarm2]
            
        }

    }
    // UPDATE
    // Controller Basics #3
    func addAlarm(fireTimeFromMidnight: TimeInterval, name: String) -> Alarm {
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        return alarm
        
    }
    // Controller Basics #4
    func update(alarm: Alarm, fireTimeFromMidnight: TimeInterval, name: String) {
        alarm.fireTimeFromMidnight = fireTimeFromMidnight
        alarm.name = name
        
    }
    /// DELETE
    // Controller Basics #5
    func delete(alarm: Alarm) {
        guard let index = alarms.index(of: alarm) else {return}
        alarms.remove(at: index)
        
    }
    // Custom Protocol #6
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
}




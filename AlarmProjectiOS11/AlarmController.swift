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
        // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #7
        loadFromPersistentStorage()
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
        // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #7
        saveToPersistentStorage()
        return alarm
        
    }
    // Controller Basics #4
    func update(alarm: Alarm, fireTimeFromMidnight: TimeInterval, name: String) {
        alarm.fireTimeFromMidnight = fireTimeFromMidnight
        alarm.name = name
        // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #7
        saveToPersistentStorage()
        
    }
    /// DELETE
    // Controller Basics #5
    func delete(alarm: Alarm) {
        guard let index = alarms.index(of: alarm) else {return}
        alarms.remove(at: index)
        // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #7
        saveToPersistentStorage()
    }
    // Custom Protocol #6
    func toggleEnabled(for alarm: Alarm) {
        if alarm.enabled {
            alarm.enabled = false
        } else {
            alarm.enabled = true
            // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #7
            saveToPersistentStorage()
        }
    }
    // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #1
    private static var persistentAlarmsFilePath: String? {
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        guard let documentsDirectory = directories.first as NSString? else { return nil }
        return documentsDirectory.appendingPathComponent("Alarms.plist")
    }
    // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #2 and #3
    func saveToPersistentStorage() {
        guard let indexPath = AlarmController.persistentAlarmsFilePath else { return }
        NSKeyedArchiver.archiveRootObject(self.alarms, toFile: indexPath)
    }
    // Persistence with NSKeyedArchiver and NSKeyedUnarchiver #4 and #5
    func loadFromPersistentStorage() {
        guard let indexPath = AlarmController.persistentAlarmsFilePath else { return }
        guard let alarms = NSKeyedUnarchiver.unarchiveObject(withFile: indexPath) as? [Alarm] else { return }
        self.alarms = alarms
    }
}
// Schedule and Cancel Local Notifications using a Custom Protocol and Extension #1
protocol AlarmScheduler {
    
    func scheduleUserNotifications() {
    
    }
    func cancelUserNotifications() {
    
    }
    
}










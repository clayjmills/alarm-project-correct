//
//  AlarmListTableViewController.swift
//  AlarmProjectiOS11
//
//  Created by Clay Mills on 2/13/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit
// Custom Protocol #5
class AlarmListTableViewController: UITableViewController, SwitchTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //SwitchTableViewCell #3 required 1
        return AlarmController.sharedInstance.alarms.count
    }
    
    // SwitchTableViewCell #3 required 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell ?? SwitchTableViewCell()
        cell.alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        //Custom Protocol #5 continued
        cell.delegate = self
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // SwitchTableViewCell #4
            let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            AlarmController.sharedInstance.delete(alarm: alarm)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //SwitchTableViewCell #4
            
        }
    }
    
    // Custom Protocol #7
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        AlarmController.sharedInstance.toggleEnabled(for: alarm)
        if alarm.enabled {
        }else {
            
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Prep for segue #1
            if segue.identifier == "toAlarmDetailVC" {
                // prep for segue #2
                guard let alarmDetailVC = segue.destination as? AlarmDetailTableViewController,
                    // prep for segue #3 and #4
                    let indexPath = tableView.indexPathForSelectedRow else {return}
                // prep for segue #5
                alarmDetailVC.alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            }
        }
    }
    
}

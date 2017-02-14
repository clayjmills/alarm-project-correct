//
//  AlarmDetailTableViewController.swift
//  AlarmProjectiOS11
//
//  Created by Clay Mills on 2/13/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var datePickerCell: UIDatePicker!
    
    @IBOutlet weak var textFieldCell: UITextField!
    
    @IBOutlet weak var enableButton: UIButton!
    
    @IBAction func enableButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //final functionality on detail view #1, 2, 3
        guard let title = textFieldCell.text, let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else {return}
        let timeInterValSinceMidnight = datePickerCell.date.timeIntervalSince(thisMorningAtMidnight)
        if let alarm = alarm {
            AlarmController.sharedInstance.update(alarm: alarm, fireTimeFromMidnight: timeInterValSinceMidnight, name: title)
            self.alarm = alarm
        }
    }
    
    //Wire up the Alarm Detail Table View #2
    private func updateViews() {
        guard let alarm = alarm, let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight, isViewLoaded else {
            enableButton.isHidden = true
            return
        }
        self.title = alarm.name
    }
    // Wire up the Alarm Detail Table View #3
    var alarm: Alarm? {
        didSet {
            if isViewLoaded {
                updateViews()
            } else {
                loadView()
                updateViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Wire up the Alarm Detail Table View #4
        updateViews()
        
    }
    
}

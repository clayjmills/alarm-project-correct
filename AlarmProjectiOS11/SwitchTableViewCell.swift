//
//  SwitchTableViewCell.swift
//  AlarmProjectiOS11
//
//  Created by Clay Mills on 2/13/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit
// Custom Protocol #1
protocol SwitchTableViewCellDelegate: class {
    // Custom Protocol #2
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // Custom Protocol #3
    weak var delegate: SwitchTableViewCellDelegate?
    
    // SwitchTableViewCell #1
    var alarm: Alarm? {
        // SwitchTableViewCell #2
        didSet {
            guard let alarm = alarm else { return }
            timeLabel.text = alarm.fireTimeAsString
            nameLabel.text = alarm.name
            alarmSwitch.isOn = alarm.enabled
        }
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        // Custom Protocol #4
        delegate?.switchCellSwitchValueChanged(cell: self)
    }


}

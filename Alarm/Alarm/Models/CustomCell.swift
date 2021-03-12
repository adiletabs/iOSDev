//
//  CustomCell.swift
//  Alarm
//
//  Created by Adilet Absatov on 12.03.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var displayTime: UILabel!
    
    @IBOutlet weak var note: UILabel!
    
    @IBAction func toggle(_ sender: UISwitch) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

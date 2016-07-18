//
//  FilterTableViewCell.swift
//  Yelp
//
//  Created by Haena Kim on 7/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FilterTableViewCellDelegate {
    optional func filterTableViewCell(filterTableViewCell: FilterTableViewCell, didChangeValue value: Bool)
}

class FilterTableViewCell: UITableViewCell {

    //var flags = true
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var propertyButton: UISwitch!
    
    weak var delegate: FilterTableViewCellDelegate?
    
    @IBAction func onSwitchAction(sender: UISwitch) {
        print("switching to \(propertyButton.on)")
       // flags = !flags
        delegate?.filterTableViewCell?(self, didChangeValue: propertyButton.on)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

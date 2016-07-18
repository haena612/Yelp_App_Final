//
//  DealCell.swift
//  Yelp
//
//  Created by Haena Kim on 7/15/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol DealCellDelegate {
    optional func dealCellDidUpdateSwitch(dealCell: DealCell)
}
   
class DealCell: UITableViewCell {
    
    @IBOutlet weak var dealSwitch:UISwitch!
    @IBAction func onDealSwitchChagne(sender: UISwitch) {
        delegate?.dealCellDidUpdateSwitch?(self)
    }
    
    weak var delegate: DealCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

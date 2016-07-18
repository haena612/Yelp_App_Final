//
//  DistanceCell.swift
//  Yelp
//
//  Created by Haena Kim on 7/15/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol DistanceCellDelegate {
    optional func distanceCell(distanceCell: DistanceCell, didUpdateDistance distanceValue: String)
}

class DistanceCell: UITableViewCell {

    weak var delegate: DistanceCellDelegate?
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

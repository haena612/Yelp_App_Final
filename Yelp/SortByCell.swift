//
//  SortByCell.swift
//  Yelp
//
//  Created by Haena Kim on 7/15/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SortByCellDelegate {
    optional func sortByCell(sortByCell: SortByCell, didUpdateSortby SortbyValue: String)
}

class SortByCell: UITableViewCell {


    @IBOutlet weak var sortByLabel: UILabel!
    weak var delegate: SortByCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  Filter.swift
//  Yelp
//
//  Created by Haena Kim on 7/16/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

class Filter {
    var deal = false
    var distance = 10000
    var sortBy = ""
    var selectedSortByIndex = 0
    var selectedDistanceIndex = 0
    var selectedCategories = [String]()
    var searchString: String?
    
    static let sharedInstance = Filter()
}
//
//  FilterViewController.swift
//  Yelp
//
//  Created by Haena Kim on 7/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FilterViewControllerDelegate {
    optional func filterViewControllerDidUpdateFilter (filterVC: FilterViewController)
}

class FilterViewController: UIViewController {
    
    let categories = [["name" : "Afghan", "code": "afghani"],
                      ["name" : "African", "code": "african"],
                      ["name" : "American, New", "code": "newamerican"],
                      ["name" : "American, Traditional", "code": "tradamerican"],
                      ["name" : "Arabian", "code": "arabian"],
                      ["name" : "Argentine", "code": "argentine"],
                      ["name" : "Armenian", "code": "armenian"],
                      ["name" : "Asian Fusion", "code": "asianfusion"],
                      ["name" : "Asturian", "code": "asturian"],
                      ["name" : "Australian", "code": "australian"],
                      ["name" : "Austrian", "code": "austrian"],
                      ["name" : "Baguettes", "code": "baguettes"],
                      ["name" : "Bangladeshi", "code": "bangladeshi"],
                      ["name" : "Barbeque", "code": "bbq"],
                      ["name" : "Basque", "code": "basque"],
                      ["name" : "Bavarian", "code": "bavarian"],
                      ["name" : "Beer Garden", "code": "beergarden"],
                      ["name" : "Beer Hall", "code": "beerhall"],
                      ["name" : "Beisl", "code": "beisl"],
                      ["name" : "Belgian", "code": "belgian"],
                      ["name" : "Bistros", "code": "bistros"],
                      ["name" : "Black Sea", "code": "blacksea"],
                      ["name" : "Brasseries", "code": "brasseries"],
                      ["name" : "Brazilian", "code": "brazilian"],
                      ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
                      ["name" : "British", "code": "british"],
                      ["name" : "Buffets", "code": "buffets"],
                      ["name" : "Bulgarian", "code": "bulgarian"],
                      ["name" : "Burgers", "code": "burgers"],
                      ["name" : "Burmese", "code": "burmese"],
                      ["name" : "Cafes", "code": "cafes"],
                      ["name" : "Cafeteria", "code": "cafeteria"],
                      ["name" : "Cajun/Creole", "code": "cajun"],
                      ["name" : "Cambodian", "code": "cambodian"],
                      ["name" : "Canadian", "code": "New)"],
                      ["name" : "Canteen", "code": "canteen"],
                      ["name" : "Caribbean", "code": "caribbean"],
                      ["name" : "Catalan", "code": "catalan"],
                      ["name" : "Chech", "code": "chech"],
                      ["name" : "Cheesesteaks", "code": "cheesesteaks"],
                      ["name" : "Chicken Shop", "code": "chickenshop"],
                      ["name" : "Chicken Wings", "code": "chicken_wings"],
                      ["name" : "Chilean", "code": "chilean"],
                      ["name" : "Chinese", "code": "chinese"],
                      ["name" : "Comfort Food", "code": "comfortfood"],
                      ["name" : "Corsican", "code": "corsican"],
                      ["name" : "Creperies", "code": "creperies"],
                      ["name" : "Cuban", "code": "cuban"],
                      ["name" : "Curry Sausage", "code": "currysausage"],
                      ["name" : "Cypriot", "code": "cypriot"],
                      ["name" : "Czech", "code": "czech"],
                      ["name" : "Czech/Slovakian", "code": "czechslovakian"],
                      ["name" : "Danish", "code": "danish"],
                      ["name" : "Delis", "code": "delis"],
                      ["name" : "Diners", "code": "diners"],
                      ["name" : "Dumplings", "code": "dumplings"],
                      ["name" : "Eastern European", "code": "eastern_european"],
                      ["name" : "Ethiopian", "code": "ethiopian"],
                      ["name" : "Fast Food", "code": "hotdogs"],
                      ["name" : "Filipino", "code": "filipino"],
                      ["name" : "Fish & Chips", "code": "fishnchips"],
                      ["name" : "Fondue", "code": "fondue"],
                      ["name" : "Food Court", "code": "food_court"],
                      ["name" : "Food Stands", "code": "foodstands"],
                      ["name" : "French", "code": "french"],
                      ["name" : "French Southwest", "code": "sud_ouest"],
                      ["name" : "Galician", "code": "galician"],
                      ["name" : "Gastropubs", "code": "gastropubs"],
                      ["name" : "Georgian", "code": "georgian"],
                      ["name" : "German", "code": "german"],
                      ["name" : "Giblets", "code": "giblets"],
                      ["name" : "Gluten-Free", "code": "gluten_free"],
                      ["name" : "Greek", "code": "greek"],
                      ["name" : "Halal", "code": "halal"],
                      ["name" : "Hawaiian", "code": "hawaiian"],
                      ["name" : "Heuriger", "code": "heuriger"],
                      ["name" : "Himalayan/Nepalese", "code": "himalayan"],
                      ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
                      ["name" : "Hot Dogs", "code": "hotdog"],
                      ["name" : "Hot Pot", "code": "hotpot"],
                      ["name" : "Hungarian", "code": "hungarian"],
                      ["name" : "Iberian", "code": "iberian"],
                      ["name" : "Indian", "code": "indpak"],
                      ["name" : "Indonesian", "code": "indonesian"],
                      ["name" : "International", "code": "international"],
                      ["name" : "Irish", "code": "irish"],
                      ["name" : "Island Pub", "code": "island_pub"],
                      ["name" : "Israeli", "code": "israeli"],
                      ["name" : "Italian", "code": "italian"],
                      ["name" : "Japanese", "code": "japanese"],
                      ["name" : "Jewish", "code": "jewish"],
                      ["name" : "Kebab", "code": "kebab"],
                      ["name" : "Korean", "code": "korean"],
                      ["name" : "Kosher", "code": "kosher"],
                      ["name" : "Kurdish", "code": "kurdish"],
                      ["name" : "Laos", "code": "laos"],
                      ["name" : "Laotian", "code": "laotian"],
                      ["name" : "Latin American", "code": "latin"],
                      ["name" : "Live/Raw Food", "code": "raw_food"],
                      ["name" : "Lyonnais", "code": "lyonnais"],
                      ["name" : "Malaysian", "code": "malaysian"],
                      ["name" : "Meatballs", "code": "meatballs"],
                      ["name" : "Mediterranean", "code": "mediterranean"],
                      ["name" : "Mexican", "code": "mexican"],
                      ["name" : "Middle Eastern", "code": "mideastern"],
                      ["name" : "Milk Bars", "code": "milkbars"],
                      ["name" : "Modern Australian", "code": "modern_australian"],
                      ["name" : "Modern European", "code": "modern_european"],
                      ["name" : "Mongolian", "code": "mongolian"],
                      ["name" : "Moroccan", "code": "moroccan"],
                      ["name" : "New Zealand", "code": "newzealand"],
                      ["name" : "Night Food", "code": "nightfood"],
                      ["name" : "Norcinerie", "code": "norcinerie"],
                      ["name" : "Open Sandwiches", "code": "opensandwiches"],
                      ["name" : "Oriental", "code": "oriental"],
                      ["name" : "Pakistani", "code": "pakistani"],
                      ["name" : "Parent Cafes", "code": "eltern_cafes"],
                      ["name" : "Parma", "code": "parma"],
                      ["name" : "Persian/Iranian", "code": "persian"],
                      ["name" : "Peruvian", "code": "peruvian"],
                      ["name" : "Pita", "code": "pita"],
                      ["name" : "Pizza", "code": "pizza"],
                      ["name" : "Polish", "code": "polish"],
                      ["name" : "Portuguese", "code": "portuguese"],
                      ["name" : "Potatoes", "code": "potatoes"],
                      ["name" : "Poutineries", "code": "poutineries"],
                      ["name" : "Pub Food", "code": "pubfood"],
                      ["name" : "Rice", "code": "riceshop"],
                      ["name" : "Romanian", "code": "romanian"],
                      ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
                      ["name" : "Rumanian", "code": "rumanian"],
                      ["name" : "Russian", "code": "russian"],
                      ["name" : "Salad", "code": "salad"],
                      ["name" : "Sandwiches", "code": "sandwiches"],
                      ["name" : "Scandinavian", "code": "scandinavian"],
                      ["name" : "Scottish", "code": "scottish"],
                      ["name" : "Seafood", "code": "seafood"],
                      ["name" : "Serbo Croatian", "code": "serbocroatian"],
                      ["name" : "Signature Cuisine", "code": "signature_cuisine"],
                      ["name" : "Singaporean", "code": "singaporean"],
                      ["name" : "Slovakian", "code": "slovakian"],
                      ["name" : "Soul Food", "code": "soulfood"],
                      ["name" : "Soup", "code": "soup"],
                      ["name" : "Southern", "code": "southern"],
                      ["name" : "Spanish", "code": "spanish"],
                      ["name" : "Steakhouses", "code": "steak"],
                      ["name" : "Sushi Bars", "code": "sushi"],
                      ["name" : "Swabian", "code": "swabian"],
                      ["name" : "Swedish", "code": "swedish"],
                      ["name" : "Swiss Food", "code": "swissfood"],
                      ["name" : "Tabernas", "code": "tabernas"],
                      ["name" : "Taiwanese", "code": "taiwanese"],
                      ["name" : "Tapas Bars", "code": "tapas"],
                      ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
                      ["name" : "Tex-Mex", "code": "tex-mex"],
                      ["name" : "Thai", "code": "thai"],
                      ["name" : "Traditional Norwegian", "code": "norwegian"],
                      ["name" : "Traditional Swedish", "code": "traditional_swedish"],
                      ["name" : "Trattorie", "code": "trattorie"],
                      ["name" : "Turkish", "code": "turkish"],
                      ["name" : "Ukrainian", "code": "ukrainian"],
                      ["name" : "Uzbek", "code": "uzbek"],
                      ["name" : "Vegan", "code": "vegan"],
                      ["name" : "Vegetarian", "code": "vegetarian"],
                      ["name" : "Venison", "code": "venison"],
                      ["name" : "Vietnamese", "code": "vietnamese"],
                      ["name" : "Wok", "code": "wok"],
                      ["name" : "Wraps", "code": "wraps"],
                      ["name" : "Yugoslav", "code": "yugoslav"]]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dealswitchOn = false
    
    var distanceArray = [10000000, 10000, 50000]
    var selectedDistanceIndex = 0
    var isDistanceExpanded = false
    
    
    let sortbyArray = ["Best Matched", "Shortest Distance", "Highest Rated"]
    var selectedSortByIndex = 0
    var isSortByExpanded = false
    
    var isCategoryCollapsed = true
    
    weak var delegate: FilterViewControllerDelegate?
    var flags = [Int: Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        //1. Getting new values from Filter to dealswitchOn everytime you load
        dealswitchOn = Filter.sharedInstance.deal
        selectedDistanceIndex = Filter.sharedInstance.selectedDistanceIndex
        selectedSortByIndex = Filter.sharedInstance.selectedSortByIndex
        
        //        selectedDistance = Filter.sharedInstance.distance
        //        selectedSortBy = Filter.sharedInstance.sortBy
        
        
        //(0..<40).map {_ in flags.append(true) }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchAction(sender: UIBarButtonItem) {
        let filter = Filter.sharedInstance // grab filter values from Filter
        
        //2. set new values to Filter
        filter.selectedCategories.removeAll()
        
        for (row ,isSelected) in flags {
            if isSelected{
                filter.selectedCategories.append(categories[row]["code"]!)
            }
        }
        
        filter.deal = dealswitchOn
        filter.distance = distanceArray[selectedDistanceIndex]
        filter.sortBy = sortbyArray[selectedSortByIndex]
        filter.selectedSortByIndex = selectedSortByIndex
        //filter.selectedDistanceIndex = selectedDistanceIndex
        
        
        delegate?.filterViewControllerDidUpdateFilter!(self)
        
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelAction(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section{
        case 0: return 1
        case 1: return distanceArray.count
        case 2: return sortbyArray.count
        case 3: return categories.count + 1
        default: return 0
        }
        
        //return categories.count + 1
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        header.backgroundColor = UIColor.orangeColor()
        let headerText = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        
        
        
        switch section{
        case 0: headerText.text = "Deal"
        case 1: headerText.text = "Distance"
        case 2: headerText.text = "Sort By"
        case 3: headerText.text = "Categories"
        default: headerText.text = ""
        }
        
        header.addSubview(headerText)
        
        return header
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0: return 44
        case 1:
            if isDistanceExpanded {
                return 44
            } else {
                //                if indexPath.row == ´selectedDistanceIndex {
                //                    return 44
                //                } else {
                //                    return 0
                //                }
                
                return indexPath.row == selectedDistanceIndex ? 44 : 0
            }
        case 2:
            if isSortByExpanded {
                return 44
            } else {
                return indexPath.row == selectedSortByIndex ? 44 : 0
            }
        case 3:
            if isCategoryCollapsed {
                if indexPath.row > 2 && indexPath.row != categories.count {
                    return 0
                }
            }
        default:
            break
        }
        return 35.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("DealCell") as! DealCell
            cell.delegate = self
            cell.dealSwitch.on = dealswitchOn //3. on TableView, switchOn value is set as dealswitchOn from viewdidload
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("DistanceCell") as! DistanceCell
            
            //            if indexPath.row == 0 {
            //                cell.distanceLabel.text = "Auto"
            //            }else {
            //                cell.distanceLabel.text = "\(distanceArray[indexPath.row]) m"
            //                }
            
            cell.distanceLabel.text = indexPath.row == 0 ? "Auto" : "\(distanceArray[indexPath.row]) m"
            cell.delegate = self
            
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("SortByCell") as! SortByCell
            cell.sortByLabel.text = "\(sortbyArray[indexPath.row])"
            cell.delegate = self
            return cell
            
        case 3:
            print ("index.path \(indexPath.row)")
            if indexPath.row != categories.count {
                let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as! FilterTableViewCell
                
                cell.propertyLabel.text = categories[indexPath.row]["name"]
                cell.delegate = self
                
                //        if flags[indexPath.row] != nil{
                //            cell.propertyButton.on = false
                //        } else{
                //            cell.propertyButton.on = flags[indexPath.row]!
                //        }
                cell.propertyButton.on = flags[indexPath.row] ?? false
                setCategoryCellVisible(indexPath.row, cell: cell)
                
                return cell
                
            } else {
                // This is the last row
                
                
                let cell = tableView.dequeueReusableCellWithIdentifier("ViewAllCell", forIndexPath: indexPath) as! ViewAllCell
                
                let tapViewAllCell = UITapGestureRecognizer(target: self, action: #selector(FilterViewController.tapViewAll(_:)))
                cell.addGestureRecognizer(tapViewAllCell)
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 1:
            //            selectedDistance = distanceArray[indexPath.row] //get the item from selected array item
            //              distanceArray
            
            selectedDistanceIndex = indexPath.row
            isDistanceExpanded = !isDistanceExpanded
            tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Fade) // magical!!
            
            
            break
        case 2:
            
            selectedSortByIndex = indexPath.row
            isSortByExpanded = !isSortByExpanded
            tableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Fade)
            break

        default:
            break
        }
    }
    // MARK: Category area
    
    func setCategoryCellVisible(row: Int, cell: FilterTableViewCell) {
        if isCategoryCollapsed && row > 2 && row != categories.count {
            cell.propertyLabel.hidden = true
            cell.propertyButton.hidden = true
            return
        }
        cell.propertyLabel.hidden = false
        cell.propertyButton.hidden = false
    }
    
    func tapViewAll(sender:UITapGestureRecognizer) {
        // Get ViewAllCell
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: categories.count, inSection: 3)) as! ViewAllCell
        
        if cell.label.text == "See All" {
            cell.label.text = "Collapse"
            isCategoryCollapsed = false
        } else {
            cell.label.text = "See All"
            isCategoryCollapsed = true
        }
        
        tableView.reloadSections(NSIndexSet(index: 3), withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

extension FilterViewController: DealCellDelegate{
    func dealCellDidUpdateSwitch(dealCell: DealCell) {
        dealswitchOn = dealCell.dealSwitch.on
    }
}

extension FilterViewController: DistanceCellDelegate{
    func distanceCell(distanceCell: DistanceCell, didUpdateDistance distancevalue: String) {
    }
}

extension FilterViewController: SortByCellDelegate{
    func sortByCell(sortByCell: SortByCell, didUpdateSortby SortbyValue: String) {
        
    }
}

extension FilterViewController: FilterTableViewCellDelegate{
    
    func filterTableViewCell(filterTableViewCell: FilterTableViewCell, didChangeValue value: Bool) {
        print("filterVC got the signal from filterCell")
        let ip = tableView.indexPathForCell(filterTableViewCell)
        flags[ip!.row] = value
    }
    
}
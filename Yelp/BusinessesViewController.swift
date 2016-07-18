//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
//import MBProgressHUD

class BusinessesViewController: UIViewController, FilterViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var businesses: [Business]!
    var searchBar: UISearchBar!
    var searchSettings = Filter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.reloadData()
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for businessdata in businesses{
                print(businessdata.name!)
                print(businessdata.address!)
            }
            self.tableView.reloadData()
        })
        
    }
    
     //Perform the search.
    private func doSearch() {
        
        //let filter = Filter()
        Business.searchWithTerm(searchBar.text!, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for businessdata in businesses{
                print(businessdata.name!)
                print(businessdata.address!)
            }
            self.tableView.reloadData()
        })
        //print("searched \(filter.searchString)")

    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let navController = segue.destinationViewController as! UINavigationController
        let filterVC = navController.topViewController as! FilterViewController
        filterVC.delegate = self
    }
    
    func filterViewControllerDidUpdateFilter(filterVC: FilterViewController) {
        print("businessVC got filter from filterVC")
        let filter = Filter.sharedInstance // get Filter values from filterVC through Filter
        print("cat: \(filter.selectedCategories)")
        print("deal: \(filter.deal)")
        print("distance: \(filter.distance)")
        print("sort: \(filter.sortBy)")
        let sortTest = YelpSortMode(rawValue: filter.selectedSortByIndex)
        Business.searchWithTerm("Thai", sort: sortTest, categories: filter.selectedCategories, deals: filter.deal, distance: filter.distance) { (businesses:[Business]!, error: NSError!) in
            self.businesses = businesses
            self.tableView.reloadData()
        }
        
    }
}

// SearchBar methods
extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        doSearch()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}


extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return businesses?.count ?? 0
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessCell
        let business = businesses![indexPath.row]
        cell.business = business
        cell.ImageView.setImageWithURL(business.imageURL!)
        cell.name.text = business.name
        cell.name.sizeToFit()
        cell.distance.text = business.distance
        cell.ratingImage.setImageWithURL(business.ratingImageURL!)
        cell.numReview.text = "\(business.reviewCount!)" + " reviews"
        cell.address.text = business.address
        cell.categories.text = business.categories
        
        
        
        return cell
    }
}


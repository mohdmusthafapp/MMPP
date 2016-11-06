//
//  MMMenuVC.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/29/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit
protocol MMMenuTVCDelegate {
    
    func updatedNewsWithSelectedNews(sourceModel:SourceModel)
}

class MMMenuTVC: UITableViewController {

    var delegate:MMMenuTVCDelegate?
    var menuSourceList = [SourceModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         MMNewsServiceHelper.getMMNewsRaftSourceList({ (sourceModelList, error) in
            self.menuSourceList = MMCommonModel.sharedInstance.getSource()!
            self.tableView.reloadData()
        })
        let tableHeaderView = MMMenuTopView.instanceFromNib()
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: tableHeaderView), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuSourceList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MMMenuCell {
        let cell =  getSourceCell()
        let sourceModel = menuSourceList[indexPath.row]
        cell.mmMenuTextLabel!.text = sourceModel.source_code?.capitalizedString
        self.updateImage(cell, source: sourceModel, indexPath: indexPath)

        return cell
    }
 
    func getSourceCell() -> MMMenuCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier(MMMenuCell.menuCellReuseIdentifier)as! MMMenuCell
        return cell;
    }
    
    func updateImage(cell:MMMenuCell, source:SourceModel, indexPath:NSIndexPath) -> () {
        
        let imgURL: NSURL = NSURL(string: source.logo_small!)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if (data != nil){
                dispatch_async(dispatch_get_main_queue(),{
                    cell.mmMenuImageView?.image = UIImage(data: data!)
                })
            }
        }).resume()
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let sourceModel = menuSourceList[indexPath.row]
        
        let myDict: [String:AnyObject] = [ "SourceModel": sourceModel]
        NSNotificationCenter.defaultCenter().postNotificationName("refresh", object: myDict)
//        delegate?.updatedNewsWithSelectedNews(sourceModel)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

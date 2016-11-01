//
//  MMNewsRaftRootVC.swift
//  MMNewsRaft
//
//  Created by Musthafa PP, Muhammed on 10/29/16.
//  Copyright © 2016 Musthafa PP, Muhammed. All rights reserved.
//

import UIKit

class MMNewsRootVC: UITableViewController {

    @IBOutlet weak var mmMenuButon: UIBarButtonItem!
    var articlesList = [ArticlesModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        articlesList = MMNewsServiceHelper.getArticles()!

        UIApplication.sharedApplication().statusBarStyle = .LightContent
        if revealViewController() != nil{
            
            mmMenuButon.target = self.revealViewController()
            mmMenuButon.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
//        CommonActivityVC.showActivityViewer()
        //self.performSelector(Selector(rightButton("")), withObject: nil, afterDelay: 1500000)
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
        return articlesList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MMCardCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! MMCardCell

        // Configure the cell...
        let articles = articlesList[indexPath.row]
        
        cell.source_title!.text = articles.title!.capitalizedString

        cell.source_description!.text = articles.source_description!.capitalizedString
        self.updateImage(cell,article: articles)
        return cell
    }
 
    func updateImage(cell:MMCardCell, article:ArticlesModel) -> () {
    
        guard article.urlToImage != nil else {
            return
        }
        let imageUrl = NSURL(string: article.urlToImage!)
        
        // reset reused cell image to placeholder

        
        // async image
        if cell.source_Image == nil {
            
            let request: NSURLRequest = NSURLRequest(URL: imageUrl!)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response: NSURLResponse?,data: NSData?,error: NSError?) in
                
                let image = UIImage(data: data!)
                dispatch_async(dispatch_get_main_queue(), {
                    cell.source_Image!.image = image
                    
                })
            })
        }

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

    @IBAction func mmMenuButtonAction(sender: AnyObject) {
    }
    @IBAction func rightButton(sender: AnyObject) {
        CommonActivityVC.showActivityViewer()
//        sleep(10)
       // CommonActivityVC.hideActivityViewer()
    }
}

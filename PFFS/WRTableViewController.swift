//
//  WRTableViewController.swift
//  PFFS
//
//  Created by connor on 6/6/16.
//  Copyright © 2016 Connor. All rights reserved.
//

import UIKit

class WRTableViewController: UITableViewController {

    var widerecievers: [WR] = []
    var specificWideReciever: WR!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        WR.getObjectsWithCompletion({(widerecievers:[AnyObject]!, error: NSError!) -> () in
            
            if (error == nil) {
                self.widerecievers = widerecievers as! [WR]
                self.tableView.reloadData()
            } else {
                print("error loading activities")
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return widerecievers.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("widereciever", forIndexPath: indexPath)
        let currentWidereciever = self.widerecievers[indexPath.row]
        cell.textLabel?.text = currentWidereciever.name
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let client = BAAClient.sharedClient()
        if client.isAuthenticated() {
        } else {
            self.tabBarController?.performSegueWithIdentifier("showLogin", sender:nil)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "myWRSegue" {
            let nextScene = segue.destinationViewController as! PlayerViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedWR = widerecievers[indexPath.row]
                print(selectedWR)
                nextScene.player = selectedWR
            }
        }
        
        
    }
    
    
    
}

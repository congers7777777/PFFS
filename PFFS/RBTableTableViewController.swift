//
//  RBTableTableViewController.swift
//  PFFS
//
//  Created by connor on 6/3/16.
//  Copyright © 2016 Connor. All rights reserved.
//

import UIKit

class RBTableTableViewController: UITableViewController {
    
    var runningbacks: [RB] = []
    var specificRunningBack: RB!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        RB.getObjectsWithCompletion({(runningbacks:[AnyObject]!, error: NSError!) -> () in
            
            if (error == nil) {
                self.runningbacks = runningbacks as! [RB]
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
        return runningbacks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("runningback", forIndexPath: indexPath)
        let currentRunningback = self.runningbacks[indexPath.row]
        cell.textLabel?.text = currentRunningback.name

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
        if segue.identifier == "myRBSegue" {
            let nextScene = segue.destinationViewController as! PlayerViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRB = runningbacks[indexPath.row]
                print(selectedRB)
                nextScene.player = selectedRB
            }
        }
        
        
    }

    

}

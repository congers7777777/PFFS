//
//  PlayerViewController.swift
//  PFFS
//
//  Created by connor on 5/26/16.
//  Copyright © 2016 Connor. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerName: UILabel!
  
    @IBOutlet weak var playerTeam: UILabel!
    
    @IBOutlet weak var playerDescription: UITextView!
    
    
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(player)
        playerName.text = player?.name
        playerTeam.text = player?.team
        playerDescription.text = player?.bio

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelView(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
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

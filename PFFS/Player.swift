//
//  Player.swift
//  PFFS
//
//  Created by connor on 5/11/16.
//  Copyright © 2016 Connor. All rights reserved.
//

import UIKit

class Player: BAAObject {
    var name: String
    var team: String
    var bio: String
    
    override init(dictionary: [NSObject : AnyObject]!) {
        self.name = dictionary["Name"]! as! String
        self.team = dictionary["Team"]! as! String
        self.bio = dictionary["Description"]! as! String
        super.init(dictionary: dictionary)
        
    }
    
    override func collectionName() -> String! {
        return "document/PFFS-QB"
    }
    

}

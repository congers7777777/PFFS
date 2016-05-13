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
        self.name = dictionary["name"]! as! String
        self.team = dictionary["team"]! as! String
        self.bio = dictionary["description"]! as! String
        
        super.init(dictionary: dictionary)
        
    }
    
    override func collectionName() -> String! {
        return "document/bw-pffs"
    }
    

}

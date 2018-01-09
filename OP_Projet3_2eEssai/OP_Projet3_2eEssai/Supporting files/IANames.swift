//
//  RobotNames.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 08/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Support
{
    static var IANames = ["Totally Real Player",
                             "AlIce",
                             "X&@#.?",
                             "Cheap Replica",
                             "Void Filler",
                             "Technically Real",
                             "IWSNBN",
                             "Hello World Domination"]
    
    static var usedIANames = [String]()
    
    static func getIAName() -> String
    {
        let name: String
        let rand = Int(arc4random_uniform(UInt32(Support.IANames.count)))
        
        
        if IANames.count == 0
        {
            name = "ARTIFICIAL COGNITION NAMING MAXED"
        }
            
        else
        {
            name = IANames[rand]
            usedIANames.append(IANames[rand])
            IANames.remove(at: rand)
        }
        
        return name
    }
}


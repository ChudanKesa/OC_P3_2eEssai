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
    static var robotNames = ["Tachikomas",
                             "GERTY",
                             "Talos",
                             "Hadaly",
                             "Chip",
                             "SHROUD",
                             "SHOCK",
                             "Elio",
                             "Life Emulation Android",
                             "Copper",
                             "Wired",
                             "Systematic Destruction Watchamacallit",
                             "Tactical Eliminator",
                             "Wall-G",
                             "Automatic Slicing Self-Moving Device",
                             "QTP",
                             "Tim",
                             "Neohuman",
                             "Plastic Replacement",
                             "Big PieceOfMachinery",
                             "Destructive Automaton"]
    
    static var usedRobotNames = [String]()
    
    static var namesOverloaded = 0
    
    static func getRobotName() -> String
    {
        let name: String
        let rand = Int(arc4random_uniform(UInt32(Support.robotNames.count)))
        
        if Support.robotNames.count == 0
        {
            namesOverloaded += 1
            name = "RANDOM_AUTOMATON_\(String(format: "%02d", namesOverloaded))"
        }
            
        else
        {
            name = robotNames[rand]
            usedRobotNames.append(robotNames[rand])
            robotNames.remove(at: rand)
        }
        
        return name
    }
}


//
//  RandomNames.swift
//  Projet3
//
//  Created by Erwan Le Querré on 02/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Support
{
    // returns a random name so askForName can get it.
    
    static func robotNames(i: Int) -> String
    {
        var name = ""
        var rand = 0
        
        var names = ["Tachikomas",
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
        
        rand = Int(arc4random_uniform(UInt32(names.count)))
        if (rand + i) > names.count
        {
            if i < names.count
            {
                rand = 0
                name = names[rand + i]
            }
                
            else
            {
                name = "ERROR"
            }
        }
        
        
        return name
    }
}





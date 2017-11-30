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
    
    static func randomNames(i: Int) -> String
    {
        var name = ""
        var rand = 0
        
        var names = ["Gerald",
                     "Geronimo",
                     "Aindrea",
                     "Gedeon",
                     "Baghadur",
                     "Blair",
                     "Cadell",
                     "Caderyn",
                     "Caedmon",
                     "Càel",
                     "Cay",
                     "Cedric",
                     "Conlanoch",
                     "Deandre",
                     "Donogh",
                     "Duncan",
                     "Éibehar",
                     "Gabriel",
                     "Hania",
                     "Ingvar",
                     "Kaden",
                     "Rayner",
                     "Straton",
                     "Takeshi",
                     "Verner",
                     "Volker",
                     "Volundr",
                     "Walter",
                     "Wyatt",
                     "Xerces"]
        
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
    
    
    //////////
    // checks if name is already taken
    
    static func nameTaken(name entry: String, players: [Player]) -> Bool
    {
        var nameTaken = false
        
        for i in 0..<players.count
        {
            for j in 0..<players[i].party.count
            {
                if entry == players[i].party[j].name
                {
                    nameTaken = true
                }
            }
        }
        
        if entry == "ERROR" {nameTaken = true}
        
        return nameTaken
    }
}





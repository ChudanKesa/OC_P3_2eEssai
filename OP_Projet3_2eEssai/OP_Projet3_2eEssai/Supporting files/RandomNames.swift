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
    
    static var names = ["Gerald",
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
    
    static func randomNames() -> String
    {
        var name = ""
        var rand = 0
        
        if names.count == 0
        {
            name = "ERROR"
        }
        else
        {
            rand = Int(arc4random_uniform(UInt32(names.count)))
            
            name = names[rand]
            names.remove(at: rand)
        }
        
        return name
    }
    
}





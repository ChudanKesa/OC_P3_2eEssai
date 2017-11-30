//
//  NamingFunctions.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    // asks for a string. To be used for naming caracters. Also permit "" entry for random name.
    
    static func askForName() -> String
    {
        var name = ""
        var read: String?
        var error = true
        
        
        while error
        {
            read = readLine()
            
            if read != nil
            {
                name = read!
                if name == ""
                {
                    name = autoName(read: name)
                }
                error = Support.nameTaken(name: name, players: players)
                if name == "ERROR"
                {
                    print("No more automatic names availlable. Please enter a new one.\n")
                }
                if error == true && name != "ERROR"
                {
                    print("This name has alredy been taken. Please choose a new one.\n")
                }
            }
            else
            {
                print("Problem with entry. Please try again.")
                error = true
            }
        }
        return name
    }
    
   
    
    //////////
    // gives name and checks if it's already attributed. If it is, makes randomNames choose the next on the list, and so on. If there are no names left availlable, name = ERROR.
    // cannot be private due to use in Caracter -> auto init
    
    static func autoName(read: String) -> String
    {
        var name = ""
        var error = true
        var i = 0
        
        while error
        {
            name = Support.randomNames(i: i)
            error = Support.nameTaken(name: name)
            i += 1
        }
        
        return name
    }
}

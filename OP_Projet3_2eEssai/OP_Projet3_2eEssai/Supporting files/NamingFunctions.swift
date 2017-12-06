//
//  NamingFunctions.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Support
{
    static var caractersNames = [String]() // needed to memorize the caracters' names.
    
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
                    name = randomNames()
                }
                
                error = nameTaken(name: name)
                
                if name == "ERROR"
                {
                    print("No more automatic names availlable. Please enter a new one.\n")
                }
                if error == true && name != "ERROR"
                {
                    print("This name has alredy been taken. Please choose a new one.\n")
                }
                if error == false && name != "ERROR"
                {
                    caractersNames.insert(name, at: 0)
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
    
   
    
    
    
    
    // gives name and checks if it's already attributed. If there are no names left availlable, name = ERROR.
    static func autoName(read: String) -> String
    {
        var name = ""
        var error = true
        
        while error
        {
            name = Support.randomNames()
            if name == ""
            {
                error = true
            }
            else if name == "ERROR"
            {
                print("No more automatic names availlable. Please enter a new one.\n")
                name = askForName()
                error = false
            }
            else
            {
                error = nameTaken(name: name)
                if !error
                {
                    caractersNames.insert(name, at: 0)
                }
            }
        }
        
        return name
    }
    
    
    
    
    
    // checks if name is already taken
    static func nameTaken(name entry: String) -> Bool
    {
        var nameTaken = false

        for i in 0..<caractersNames.count
        {
            if entry == caractersNames[i]
            {
                nameTaken = true
            }
        }
        
        if entry == "ERROR" {nameTaken = true}
        
        
        return nameTaken
    }
}

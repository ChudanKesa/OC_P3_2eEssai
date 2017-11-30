//
//  SafeReadingFunctions.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

class Support
{
    static func askForInt(lowerLimit: Int, upperLimit: Int) -> Int
    {
        var error = true
        
        var retour = 0
        
        while error
        {
            if let read = readLine()
            {
                if let number = Int(read)
                {
                    retour = number
                    
                    if retour < lowerLimit || retour > upperLimit
                    {
                        print("Entry did not fit proposed choices. Please try again.")
                    }
                    else
                    {
                        error = false
                    }
                }
                    
                else
                {
                    print("Problem with entry. Please try again.")
                }
            }
                
            else
            {
                print("Problem with entry. Please try again.")
            }
        }
        
        return retour
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    
    static func askForString() -> String
    {
        var error = true
        
        var retour = ""
        
        while error
        {
            if let read = readLine()
            {
                retour = read
                error = false
            }
                
            else
            {
                print("Problem with entry. Please try again.")
            }
        }
        
        return retour
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    // automatic control for Y/N situations
    
    static func askYN() -> String
    {
        var error = true
        var retour = ""
        
        while error
        {
            if let read = readLine()
            {
                
                if read == ""
                {
                    retour = "y"
                }
                else
                {
                    retour = read
                }
                
                /*if retour == "123456"
                {
                    cheat()
                    print("We were trying to confirm something. Let's do that again.")
                }*/
                    
                /*else*/ if retour == "n" || retour == "N" || retour == "y" || retour == "Y"
                {
                    error = false
                }
                else
                {
                    print("Wrong imput. Please try again.")
                }
            }
            else
            {
                print("Problem with entry. Please try again.")
            }
        }
        
        return retour
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    // the one to use when asking for Int : combination of askForInt that gets an Int and askYN to confirm entry.
    
    static func secureInt(lowerLimit: Int, upperLimit: Int) -> Int
    {
        var secondEntry = true
        var select = Int()
        
        while secondEntry
        {
            select = askForInt(lowerLimit: lowerLimit, upperLimit: upperLimit)
            print("Are you sure ? Y/N")
            switch askYN()
            {
            case "Y":
                secondEntry = false
            case "y":
                secondEntry = false
            case "N":
                print("Please try again.")
            case "n":
                print("Please try again.")
            default:
                errorLog(origin: "Game", detail: "\(#line) : switch")
            }
        }
        
        return select
    }
}


//
//  Game_extention.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    // gets the players' names and puts them in Player array
    func getPlayersNames(numberOfPlayers: Int) -> [Player]
    {
        players = [Player]()
        
        var name = ""
        print("Please enter the names of the players.")
        
        for i in 1...numberOfPlayers
        {
            print("Enter name of Player\(i) :")
            name = Support.askForString()
            players.append(Player(name: name))
        }
        
        return players
    }
    
    
    
    
    
    func getNPlayers() -> Int
    {
        var validated = false
        var nPlayers = 0
        
        while !validated
        {
            nPlayers = readNPlayers()
            validated = confirmNPlayers()
        }
        
        return nPlayers
    }
    
    
    
    
    
    // asks for number of people playing
    func readNPlayers() -> Int
    {
        var numberOfPlayers = 0
        
        print("How many people are playing ?")
        
        numberOfPlayers = Support.askForInt(lowerLimit: 1, upperLimit: Int.max)
        
        if numberOfPlayers == 1
        {
            print("You want to start a game with \(numberOfPlayers) player. Is that correct ?")
        }
        
        else
        {
            print("You want to start a game with \(numberOfPlayers) players. Is that correct ?")
        }
        print("Y/N")
        
        return numberOfPlayers
    }
    
    
    
    
    
    // confirms the number of people playing
    func confirmNPlayers() -> Bool
    {
        var validated = false
        
        while !validated
        {
            switch Support.askYN()
            {
            case "Y":
                validated = true
            case "y":
                validated = true
            case "N":
                print("Please try again. How many players ?")
            case "n":
                print("Please try again. How many players ?")
            default:
                print("Entry could not be read. Please try again.")
            }
        }
        
        return validated
    }
    
}


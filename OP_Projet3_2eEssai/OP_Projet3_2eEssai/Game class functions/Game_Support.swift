//
//  Game_Support.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    // gets # of ennemies remaining
    func getTotalEnnemiesLeft(i: Int) -> Int
    {
        var totalEnnemiesLeft = 0
        
        for t in 0..<players.count
        {
            if t != i
            {
                totalEnnemiesLeft += players[t].party.count
            }
        }
        
        return totalEnnemiesLeft
    }
    
    
    
    
    
    // gets # of allies remaining
    func getTotalAlliesLeft(i: Int) -> Int
    {
        var totalAlliesLeft = 0
        
        for t in 0..<players.count
        {
            if t == i
            {
                totalAlliesLeft += players[t].party.count
            }
        }
        
        return totalAlliesLeft
    }
    
    
    
    
    
    // gets # and positions of healers
    func powerCount(powerPresent: inout Bool, powerPosition: inout [Int], numberOfPowers: inout Int, i: Int)
    {
        numberOfPowers = 0
        powerPresent = false
        
        for _ in 0..<powerPosition.count
        {
            powerPosition.remove(at: 0)
        }
        
        for j in 0..<players[i].party.count
        {
            if players[i].party[j] is Wizzard
            {
                powerPresent = true
                numberOfPowers += 1
                powerPosition.append(j)
            }
        }
    }
    
    
    
    
    
    // asks what to do
    func actionChoice() -> Int
    {
        print("""
            What will you do ?
            1. Attack
            2. Use power
            """)
        
        return Support.secureInt(lowerLimit: 1, upperLimit: 2)
    }
    
    
    
    
    
    // calls players whose turn it is
    func callPlayer(i: Int)
    {
        print("\(players[i].name), it's your turn.")
        usleep(1 * 100 * 1000)
    }
}



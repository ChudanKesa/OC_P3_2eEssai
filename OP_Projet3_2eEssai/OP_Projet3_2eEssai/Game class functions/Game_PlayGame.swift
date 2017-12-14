//
//  Game_PlayRound.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    func playGame(players: [Player]) // one fighting turn for each player registered in *players*
    {
        var powerPresent = false
        var numberOfPowers = 0
        var powerPosition = [Int]()
        
        var totalEnnemiesLeft = Int()
        var totalAlliesLeft = Int()
        
        
        for i in 0..<players.count
        {
            totalEnnemiesLeft = getTotalEnnemiesLeft(i: i)
            totalAlliesLeft = getTotalAlliesLeft(i: i)
            
            
            if totalEnnemiesLeft >= 1 && totalAlliesLeft > 0
            {
                powerCount(powerPresent: &powerPresent, powerPosition: &powerPosition, numberOfPowers: &numberOfPowers, i: i)
                callPlayer(i: i)
                
                if players[i] is IA
                {
                    (players[i] as! IA).iaTurn(i: i, powerPosition: powerPosition, totalEnnemiesLeft: totalEnnemiesLeft, players: players)
                }
                    
                else
                {
                    if powerPresent == true
                    {
                        chooseHealOrAttack(i: i, powerPosition: powerPosition, totalEnnemiesLeft: totalEnnemiesLeft, numberOfPowers: numberOfPowers)
                    }
                    else
                    {
                        autoAttack(i: i, totalEnnemiesLeft: totalEnnemiesLeft)
                    }
                }
                
                lastOneStanding()
                removeTheDead()
            }
        }
    }
}








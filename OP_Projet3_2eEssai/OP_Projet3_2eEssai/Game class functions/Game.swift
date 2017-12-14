//
//  Game.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

class Game
{
    // get players
    // play game
    
    var players = [Player]()
    var keepPlaying = true
    
    init()
    {
        players = getPlayersNames(numberOfPlayers: getNPlayers())
        if players.count == 1
        {
            print("How many IA do you wish to fight ?")
            for _ in 1...Support.askForInt(lowerLimit: 1, upperLimit: Int.max)
            {
                players.append(IA())
            }
        }
        Support.snitch(on: players)
    }
}


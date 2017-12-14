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
        Support.snitch(on: players)
    }
}


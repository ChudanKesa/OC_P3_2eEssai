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
    var players = [Player]()
    var keepPlaying = true
    var doSort = false
    
    init()
    {
        players = getPlayersNames(numberOfPlayers: getNPlayers())
        switch players.count
        {
        case 0:
            print("How many IA do you wish to see fight ?")
            for _ in 1...Support.askForInt(lowerLimit: 2, upperLimit: Int.max)
            {
                players.append(IA())
            }
        case 1:
            print("How many IA do you wish to fight ?")
            for _ in 1...Support.askForInt(lowerLimit: 1, upperLimit: Int.max)
            {
                players.append(IA())
            }
        default:
            print("How many IA do you want to add ?")
            for _ in 0..<Support.askForInt(lowerLimit: 0, upperLimit: Int.max)
            {
                players.append(IA())
            }
            for i in 0..<players.count
            {
                if players[i] is IA {doSort = true}
            }
            if doSort {sortPlayers(players: &players)}
        }
        Support.snitch(on: players)
    }
    
    
    
    
    
    
    private func sortPlayers(players: inout [Player])
    {
        print("Would you like the players to be sorted differently ?\nY/N")
        switch Support.askYN()
        {
        case "Y":
            var caract = 0
            var movement = 0
            var again = true
            while again
            {
                print("Who is going to be moved ?\nHighest N+1 to stop sorting.\n")
                for i in 0..<players.count
                {
                    print("\(i+1): \(players[i].name)")
                }
                caract = Support.askForInt(lowerLimit: 1, upperLimit: players.count+1)
                if caract == players.count+1
                {
                    print("Are you sure to be done ?\nY/N")
                    if Support.askYN() == "Y"
                    {
                        print("Sorting over.\n")
                        again = false
                    }
                }
                else
                {
                    print("Which place should he get ?")
                    movement = Support.askForInt(lowerLimit: 1, upperLimit: players.count)
                    if caract == movement
                    {
                        print("Nothing to be done.\n")
                    }
                    else
                    {
                        if caract < movement
                        {
                            players.insert(players[caract-1], at: movement)
                        }
                        else if caract > movement
                        {
                            players.insert(players[caract-1], at: movement-1)
                        }
                        
                        if caract > movement
                        {
                            players.remove(at: caract)
                        }
                        else if caract < movement
                        {
                            players.remove(at: caract-1)
                        }
                    }
                }
            }

        case "N":
            break
        default:
            Support.errorLog(origin: "\(#file)", detail: "\(#line)")
        }
    }
    
}


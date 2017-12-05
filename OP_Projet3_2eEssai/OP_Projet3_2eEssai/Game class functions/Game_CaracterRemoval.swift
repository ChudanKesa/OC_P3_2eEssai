//
//  Game_CaracterRemoval.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    
    func lastOneStanding() // checks if there is only one dying caracter left in a party (so he can still get a turn before dying)
    {
        for l in 0..<players.count
        {
            if players[l].party.count == 1 && players[l].party[0].lifePoints == 0
            {
                switch players[l].lastOneStanding
                {
                case true:
                    players[l].lastOneStanding = false
                case false:
                    players[l].lastOneStanding = true
                }
            }
        }
    }
    
    
    
    
    
    
    func removeTheDead() // remove dead caracters of party
    {
        var deceased = [(Int, Int)]()
        
        for e in 0..<players.count
        {
            for j in 0..<players[e].party.count
            {
                if players[e].party[j].lifePoints == 0
                {
                    if !players[e].lastOneStanding
                    {
                        announceDeceased(e: e, j: j, deceased: &deceased)
                    }
                    else
                    {
                        lastOneStandingCall(e: e)
                    }
                }
            }
        }
        if deceased.count >= 1
        {
            voidDeceased(deceased: deceased)
        }
    }
    
    
    
    
    
    
    private func lastOneStandingCall(e: Int) // text to call when lastonestanding == true
    {
        sleep(1)
        print("\nOh no ! \(players[e].party[0].name) is dying !")
        usleep(1 * 100 * 1000)
        print("He muster the strenght for one last strike !")
        usleep(15 * 100 * 1000)
    }
    
    
    
    
    
    
    private func voidDeceased(deceased: [(Int, Int)]) // remove dead caracters from party
    {
        for t in (0..<deceased.count).reversed()
        {
            players[deceased[t].0].party.remove(at: deceased[t].1)
        }
    }
    
    
    
    
    
    
    private func announceDeceased(e: Int, j: Int, deceased: inout [(Int, Int)]) // calls out names of fallen warriors
    {
        print("\n\t", terminator: "")
        switch Int(arc4random_uniform(UInt32(6)))
        {
        case 0:
            print("Tough luck for \(players[e].name) ! \(players[e].party[j].name) just died !\n")
            usleep(15 * 100 * 1000)
        case 1:
            print("Sorry, \(players[e].name) ! \(players[e].party[j].name) did his best.\n")
            usleep(15 * 100 * 1000)
        case 2:
            print("One warrior down : \(players[e].party[j].name) left the game.\n")
            usleep(15 * 100 * 1000)
        case 3:
            print("\(players[e].name) will have to do with one less player !\n")
            usleep(15 * 100 * 1000)
        case 4:
            print("\(players[e].party[j].name) down ! How will \(players[e].name) react ?\n")
            usleep(15 * 100 * 1000)
        default:
            print("\(players[e].party[j].name) left this world...\n")
            usleep(15 * 100 * 1000)
        }
        deceased.append((e, j))
    }
    
}

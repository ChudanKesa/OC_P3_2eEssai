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
    
    func lastOneStanding(i: Int) // checks if there is only one dying caracter left in a party (so he can still get a turn before dying)
    {
        for l in 0..<players.count
        {
            if players[l].party.count == 1 && players[l].party[0].lifePoints == 0
            {
                switch players[l].lastOneStanding
                {
                case true:
                    if l == i {players[l].lastOneStanding = false}
                case false:
                    players[l].lastOneStanding = true
                }
            }
        }
    }
    
    
    
    
    
    
    // remove dead caracters of party
    func removeTheDead()
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
    
    
    
    
    
    
    // text to call when lastonestanding == true
    private func lastOneStandingCall(e: Int)
    {
      //  sleep(1)
        print("\nOh no ! \(players[e].party[0].name) is dying !")
       // usleep(1 * 100 * 1000)
        print("He muster the strenght for one last strike !")
       // usleep(15 * 100 * 1000)
    }
    
    
    
    
    
    
    // remove dead caracters from party
    private func voidDeceased(deceased: [(Int, Int)])
    {
        for t in (0..<deceased.count).reversed()
        {
            players[deceased[t].0].party.remove(at: deceased[t].1)
        }
    }
    
    
    
    
    
    
    // calls out names of fallen warriors
    private func announceDeceased(e: Int, j: Int, deceased: inout [(Int, Int)])
    {
        print("\n\t", terminator: "")
        switch Int(arc4random_uniform(UInt32(6)))
        {
        case 0:
            print("Tough luck for \(players[e].name) ! \(players[e].party[j].name) just died !\n")
        case 1:
            print("Sorry, \(players[e].name) ! \(players[e].party[j].name) did his best.\n")
        case 2:
            print("One warrior down : \(players[e].party[j].name) left the game.\n")
        case 3:
            print("\(players[e].name) will have to do with one less player !\n")
        case 4:
            print("\(players[e].party[j].name) down ! How will \(players[e].name) react ?\n")
        default:
            print("\(players[e].party[j].name) left this world...\n")
        }
        //usleep(15 * 100 * 1000)
        deceased.append((e, j))
    }
    
}


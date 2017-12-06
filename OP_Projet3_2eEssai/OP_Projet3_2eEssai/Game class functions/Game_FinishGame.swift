//
//  Game_FinishGame.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    func finishGame() -> Bool
    {
        var victory = false
        
        victory = false
        
        while !victory
        {
            playGame(players: players)
            removeDeadPlayers()
            victory = clearVictory()
        }

        return keepPlaying
    }
    
    
    
    
    
    
    private func removeDeadPlayers() // remove players that lost from [players]
    {
        var removal = [Int]()
        
        for i in 0..<players.count
        {
            if players[i].party.count == 0
            {
                print("\n\t")
                Support.slowWriting(sentence: "\(players[i].name)'s party was defeated...")
                sleep(1)
                print("\t", terminator: "")
                Support.slowWriting(sentence: "\(players[i].name) lost.")
                removal.append(i)
            }
        }
        
        for i in (0..<removal.count).reversed()
        {
            players.remove(at: removal[i])
        }
    }
    
    
    
    
    
    
    // gets victory status to keep or get out of the loop.
    func clearVictory() -> Bool
    {
        if players.count <= 1
        {
            announceVictory()
            switch Support.askYN()
            {
            case "y":
                prepare()
                for _ in 1...Support.caractersNames.count
                {
                    Support.names.append(Support.caractersNames[0])
                    Support.caractersNames.remove(at: 0)
                }
            case "Y":
                prepare()
                for _ in 1...Support.caractersNames.count
                {
                    Support.names.append(Support.caractersNames[0])
                    Support.caractersNames.remove(at: 0)
                }
            case "n":
                endGame()
            case "N":
                endGame()
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
            return true
        }
            
        else
        {
            return false
        }
    }
    
    
    
    
    
    
    // victory text, in case of victory.
    func announceVictory()
    {
        
        print("\n")
        sleep(1)
        print("\n")
        sleep(1)
        if players.count == 1
        {
            print(" **\\o/**\\o/**\\o/**\\o/**")
            print("\t", terminator: "")
            Support.slowWriting(sentence: "Congratulations, \(players[0].name) ! You vanquished your opponents. This game is yours !")
        }
        
        else
        {
            Support.slowWriting(sentence: "The ashes of the war finally set. No side emerged victor.\nEveryone is dead.")
        }
        print("\n")
        sleep(1)
        print("\n")
        sleep(1)
        print("Do you want to play again ?\nY/N")
    }
    
    
    
    
    
    
    // text + init if a new game starts
    func prepare()
    {
        keepPlaying = true
        print("Prepare !")
        sleep(1)
        print("")
        sleep(1)
        print("")
        players.remove(at: 0)
    }
    
    
    
    
    
    
    
    // text + init if no new game start
    func endGame()
    {
        keepPlaying = false
        print("\t************\n\t", terminator: "")
        print("Thanks for playing !")
        print("\n")
        sleep(1)
        print("")
        sleep(1)
        print("")
    }
    
}

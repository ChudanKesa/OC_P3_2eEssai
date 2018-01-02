//
//  Game_Healing.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    func oneWayHeal(i: Int, powerPosition: [Int], position: Int) // if there's only one wizzard, only the target of the heal has to be choosen
    {
        if players[i].party[powerPosition[0]] is Wizzard
        {
            if players[i].party[powerPosition[0]].weapon.name == "Long staff"
            {
                multiHeal(i: i, powerPosition: powerPosition, position: position)
            }
            else
            {
                chooseWhoToHeal(i: i, powerPosition: powerPosition, position: position)
            }
        } // if caracter is Wizzard -> useless for now but will be used when powers are added
    }
    
    
    
    
    
    
    func multiHeal(i: Int, powerPosition: [Int], position: Int) // all the text and decorations needed to call power.multiheal
    {
        print("Thanks to his Long staff, \(players[i].party[powerPosition[position]].name) will heal the entire party !")
        usleep(5 * 100 * 1000)
        (players[i].party[powerPosition[position]] as! Wizzard).power.multHealing(target: players[i].party)
        print("\tThe party got healed !")
        usleep(1 * 100 * 1000)
        for y in 0..<players[i].party.count
        {
            print("\(players[i].party[y].name) has \(players[i].party[y].lifePoints) life points.")
            players[i].party[y].symbol(caste: players[i].party[y]); print("")
        }
    }
    
    
    
    
    
    
    func chooseWhoToHeal(i: Int, powerPosition: [Int], position: Int) // choose who gets the heal
    {
        var select = Int()
        var target = players[i].party[0]
        
        print("Who do you want to heal ?")
        for y in 0..<players[i].party.count
        {
            usleep(1 * 100 * 1000)
            print("\(y+1). \(players[i].party[y].name)", terminator: " "); players[i].party[y].symbol(caste: players[i].party[y]); print(players[i].party[y].percent(life: players[i].party[y]))
        }
        select = Support.secureInt(lowerLimit: 1, upperLimit: players[i].party.count)
        target = players[i].party[select-1]
        print("\(players[i].party[powerPosition[position]].name) uses \((players[i].party[powerPosition[position]] as! Wizzard).power.useHeal(healer: players[i].party[powerPosition[position]], target: target)) on", terminator: " ")
        if players[i].party[powerPosition[position]] === target
        {
            if target.weapon.name == "Long staff"
            {
                print("the party !")
                for y in 0..<players[i].party.count
                {
                    print("\(players[i].party[y].name) has \(players[i].party[y].lifePoints) life points.")
                    players[i].party[y].symbol(caste: players[i].party[y]); print("")
                }
            }
            else
            {
                print("himself !")
                usleep(1 * 100 * 1000)
                print("\(target.name) has \(target.lifePoints) life points.")
                target.lifeBar(caracter: target)
                usleep(1 * 1000 * 1000)
            }
        }
        else
        {
            print(target.name)
            usleep(1 * 100 * 1000)
            print("\(target.name) has \(target.lifePoints) life points.")
            target.lifeBar(caracter: target)
            usleep(1 * 1000 * 1000)
        }
        
    }
    
    
    
    
    
    
    func chooseWhoHeals(i: Int, powerPosition: [Int]) -> Int // if there are several healers, choose which one acts
    {
        var select = 0
        
        print("Choose who is going to use a power :")
        for y in 0..<powerPosition.count
        {
            usleep(1 * 100 * 1000)
            print("\(y+1).", terminator:" "); players[i].party[powerPosition[y]].symbol(caste: players[i].party[powerPosition[y]]); print(" \(players[i].party[powerPosition[y]].name)")
        }
        select = Support.secureInt(lowerLimit: 1, upperLimit: powerPosition.count)
        
        return powerPosition[select-1]
    }
    
    
    
    
    
    
    func magicHappens(i: Int, powerPosition: [Int], position: Int) // use of healing functions when there are several healers -> follows chooseWhoHeals.
    {
        switch players[i].party[powerPosition[position]]
        {
        case is Wizzard:
            if players[i].party[powerPosition[position]].weapon.name == "Long staff"
            {
                multiHeal(i: i, powerPosition: powerPosition, position: position)
            }
            else
            {
                chooseWhoToHeal(i: i, powerPosition: powerPosition, position: position)
            }
        default:
            Support.errorLog(origin: "Game", detail: "l.\(#line) : power choice")
        }
    }
    
}


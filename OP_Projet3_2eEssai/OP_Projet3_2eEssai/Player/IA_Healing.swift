//
//  IA_Healing.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 21/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension IA
{
    func heal(powerPosition: [Int])
    {
        enum whichHeal
        {
            case multi
            case simple
        }
        var toDo = whichHeal.simple
        
        var healer: Caracter?
        var howManyAreHurt = 0
        
        for i in 0..<party.count
        {
            if party[i].lifePoints < party[i].maxLifePoints*80/100
            {
                howManyAreHurt += 1
            }
        }
        
        if howManyAreHurt >= 2
        {
            for i in 0..<powerPosition.count
            {
                if party[powerPosition[i]].weapon.name == "Long staff"
                {
                    healer = party[powerPosition[i]]
                    toDo = .multi
                }
            }
            
            if healer != nil
            {
                printMultiHeal(healer: healer!)
            }
            else {toDo = .simple}
        }
        
        
        if toDo == .simple
        {
            var bestWeapon = ""
            let bestHealer = getBestHealer(powerPosition: powerPosition, bestWeapon: &bestWeapon)
            let healHim = getHealTarget()

            print("\(bestHealer.name) uses \((bestHealer as! Wizzard).power.useHeal(healer: bestHealer, target: healHim)) on ", terminator: "")
            printHeal(bestHealer: bestHealer, healHim: healHim)
        }
    }
    
    
    
    
    
    
    // points the strongest healing power
    private func getBestHealer(powerPosition: [Int], bestWeapon: inout String) -> Caracter
    {
        var bestHealer = party[0]
        
        for i in 0..<powerPosition.count
        {
            if party[powerPosition[i]].weapon.name == "Sacred oak" {bestHealer = party[powerPosition[i]]; bestWeapon = "Sacred oak"}
            if bestWeapon != "Sacred oak"
            {
                if party[powerPosition[i]].weapon.name == "Staff" {bestHealer = party[powerPosition[i]]; bestWeapon = "Staff"}
            }
            if bestWeapon != "Sacred oak" && bestWeapon != "Staff"
            {
                if party[powerPosition[i]].weapon.name == "Long staff" {bestHealer = party[powerPosition[i]]}
            }
            if bestWeapon != "Sacred oak" && bestWeapon != "Staff" && bestWeapon != "Long staff"
            {
                if party[powerPosition[i]].weapon.name == "Wand" {bestHealer = party[powerPosition[i]]}
            }
        }
        
        return bestHealer
    }
    
    
    
    
    
    
    // text to show in case of multiheal
    private func printMultiHeal(healer: Caracter)
    {
        print("\(healer.name) uses \((healer as! Wizzard).power.useHeal(healer: healer, target: (healer as! Wizzard))) !")
        for y in 0..<party.count
        {
            print("\(party[y].name) has \(party[y].lifePoints) life points.")
            party[y].symbol(caste: party[y]); print("")
        }
    }
    
    
    
    
    // chooses who to heal
    private func getHealTarget() -> Caracter
    {
        var healHim = party[0]
        
        for i in 0..<party.count
        {
            if party[i].lifePoints < healHim.lifePoints
            {
                healHim = party[i]
            }
        }
        return healHim
    }
    
    
    
    
    
    // text and symbols to be shown when healing
    private func printHeal(bestHealer: Caracter, healHim: Caracter)
    {
        if bestHealer === healHim
        {
            if healHim.weapon.name == "Long staff"
            {
                print("the party !")
                for y in 0..<party.count
                {
                    party[y].symbol(caste: party[y])
                    print("\(party[y].name) has \(party[y].lifePoints) life points."); print("")
                }
            }
            else
            {
                print("himself !")
                print("\(healHim.name) has \(healHim.lifePoints) life points.")
                healHim.lifeBar(caracter: healHim)
            }
        }
        else
        {
            print("\(healHim.name) !")
            print("\(healHim.name) has \(healHim.lifePoints) life points.")
            healHim.lifeBar(caracter: healHim)
        }
    }

}



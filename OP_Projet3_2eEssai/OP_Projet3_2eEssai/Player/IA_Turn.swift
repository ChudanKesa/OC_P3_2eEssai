//
//  IA_Turn.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 08/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension IA
{
    func iaTurn(i: Int, powerPosition: [Int], players: [Player])
    {
        var ennemies = [Player]()
        var needHealing = [Caracter]()
        
            // makes a separate tab for ennemies players
        for j in 0..<players.count
        {
            if j != i && !players[j].lastOneStanding && players[j].party.count > 0
            {
                ennemies.append(players[j])
            }
        }
        
        var strongest = getStrongest(party: party)
        
        switch chooseHealOrAttack(ennemies: ennemies, maxAttack: strongest.weapon.damage, needHealing: &needHealing, powerPosition: powerPosition, strongest: &strongest)
        {
        case true:
            heal(powerPosition: powerPosition)
        case false:
            let target = getTarget(ennemies: ennemies, maxAttack: strongest.weapon.damage)
            print("\(strongest.name) attacks \(target.name) !")
            switch Int(arc4random_uniform(UInt32((2))))
            {
            case 0:
                print(strongest.newWeapon(caracter: strongest))
            case 1:
                break
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
            strongest.attack(weapon: strongest.weapon, target: target)
        }
    }
    
    
    
    
    
    // points actual strongest fighter
    private func getStrongest(party: [Caracter]) -> Caracter
    {
        var strongest = party[0]
        
        for j in 0..<party.count
        {
            if party[j].weapon.damage > strongest.weapon.damage
            {
                strongest = party[j]
            }
        }
        return strongest
    }
    
    
    
    
    
    
    // choose whether to heal or to attack
    private func chooseHealOrAttack(ennemies: [Player], maxAttack: Int, needHealing: inout [Caracter], powerPosition: [Int], strongest: inout Caracter) -> Bool
    {
        var doHeal = false
        var canHeal = false
        
        if powerPosition.count >= 1
        {
                // checks if anyone need healing
            for i in 0..<party.count
            {
                if party[i].lifePoints < (party[i].maxLifePoints*70)/100
                {
                    doHeal = true
                    needHealing.append(party[i])
                }
            }
            
        
                // checks if an enemy can be killed in one more shot
            for j in 0..<ennemies.count
            {
                for i in 0..<ennemies[j].party.count
                {
                    if ennemies[j].party[i].lifePoints <= maxAttack
                    {
                        doHeal = false
                    }
                }
            }
            
            
                // makes a wizzard attack if they don't have a strong healing weapon
            for x in 0..<powerPosition.count
            {
                if party[powerPosition[x]].weapon.name == "Long staff" || party[powerPosition[x]].weapon.name == "Sacred oak"
                {
                    canHeal = true
                }
                else
                {
                    strongest = party[powerPosition[x]]
                }
            }
        }
        if !canHeal {doHeal = false}

        
        return doHeal
    }
}


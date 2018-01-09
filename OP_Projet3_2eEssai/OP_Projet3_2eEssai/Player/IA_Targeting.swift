//
//  IA_Targeting.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 21/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension IA
{
    // choose whoever might die in one more shot, and if there's no one, chooses a wizzard.
    func getTarget(ennemies: [Player], maxAttack: Int) -> Caracter
    {
        var target: Caracter?
        {
            didSet
            {
                if target != nil && oldValue != nil
                {
                    if oldValue!.caste == .wizzard && target!.caste != .wizzard
                    {
                        target! = oldValue!
                    }
                    else if oldValue!.lifePoints < target!.lifePoints
                    {
                        target! = oldValue!
                    }
                }
            }
        }
        
        for i in 0..<ennemies.count
        {
            for j in 0..<ennemies[i].party.count
            {
                if ennemies[i].party[j].lifePoints <= maxAttack
                {
                    target = ennemies[i].party[j]
                }
            }
        }
        
        if target == nil
        {
            for i in 0..<ennemies.count
            {
                for j in 0..<ennemies[i].party.count
                {
                    if ennemies[i].party[j].caste == .wizzard
                    {
                        target = ennemies[i].party[j]
                    }
                }
            }
        }
        
        if target == nil
        {
            target = ennemies[0].party[0]
            
            for i in 0..<ennemies.count
            {
                for j in 0..<ennemies[i].party.count
                {
                    if ennemies[i].party[j].lifePoints < target!.lifePoints
                    {
                        target = ennemies[i].party[j]
                    }
                }
            }
        }
        
        return target!
    }
}



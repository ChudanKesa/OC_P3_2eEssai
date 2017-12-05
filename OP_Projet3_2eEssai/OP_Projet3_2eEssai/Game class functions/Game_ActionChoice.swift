//
//  Game_Attack.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 30/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Game
{
    // if a healer is present, choose whether to heal or attack
    func chooseHealOrAttack(i: Int, powerPosition: [Int], totalEnnemiesLeft: Int, numberOfPowers: Int)
    {
        var select = 0
        var target: Caracter
        
        switch actionChoice()
        {
        case 1:
            select = chooseAttacker(i: i)
            
            if totalEnnemiesLeft == 1
            {
                target = autoTarget(i: i)
            }
            else
            {
                target = chooseTarget(i: i)
            }
            
            attack(i: i, target: target, select: select)
            
            
        case 2:
            if numberOfPowers == 1
            {
                oneWayHeal(i: i, powerPosition: powerPosition, position: 0)
            }
            else
            {
                select = chooseWhoHeals(i: i, powerPosition: powerPosition)
                magicHappens(i: i, powerPosition: powerPosition, position: select)
            }
        default:
            Support.errorLog(origin: "Game", detail: "\(#line) : 'select' error")
        }
    }
    
    
    
    
    // auto attack mode if no healer is present
    func autoAttack(i: Int, totalEnnemiesLeft: Int)
    {
        var select = 0
        var target: Caracter
        
        select = chooseAttacker(i: i)
        
        if totalEnnemiesLeft == 1
        {
            target = autoTarget(i: i)
        }
            
        else
        {
            target = chooseTarget(i: i)
        }
        
        attack(i: i, target: target, select: select)
    }

}




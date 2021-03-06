//
//  Powers.swift
//  Projet3
//
//  Created by Erwan Le Querré on 27/10/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

class Power // powers to be used. Depends on weapon, since weapon alredy depends on class.
{
    var weapon = Weapon()
}

//////////////////////////
// MARK: HEALING

class Healing: Power // contains different ways to heal, based on weapon. Last one choose which one is actually used.
{
    func healing(target: Caracter)
    {
        if target.maxLifePoints - target.lifePoints >= 10
        {
            target.lifePoints += 10
        }
        else if target.maxLifePoints - target.lifePoints < 10 && target.lifePoints < target.maxLifePoints
        {
            target.lifePoints = target.maxLifePoints
        }
        else
        {
            // this will trigger the didSet component of lifePoints
            target.lifePoints = target.lifePoints + 10 - 10
        }
    }
    
    func superiorHealing(target: Caracter)
    {
        if target.maxLifePoints - target.lifePoints >= 18
        {
            target.lifePoints += 18
        }
        else if target.maxLifePoints - target.lifePoints < 18 && target.lifePoints < target.maxLifePoints
        {
            target.lifePoints = target.maxLifePoints
        }
        else
        {
            target.lifePoints = target.lifePoints + 10 - 10
        }
    }
    
    func weakenedHealing(target: Caracter)
    {
        if target.maxLifePoints - target.lifePoints >= 8
        {
            target.lifePoints += 8
        }
        else if target.maxLifePoints - target.lifePoints < 8 && target.lifePoints < target.maxLifePoints
        {
            target.lifePoints = target.maxLifePoints
        }
        else
        {
            target.lifePoints = target.lifePoints + 10 - 10
        }
    }
    
    func multHealing(target: [Caracter])
    {
        for i in 0..<target.count
        {
            if target[i].maxLifePoints - target[i].lifePoints >= 9
            {
                target[i].lifePoints += 9
            }
            else
            {
                target[i].lifePoints = target[i].maxLifePoints
            }
        }
    }
    

    
    
    
    
    // switch weapon to choose which power to actually use. 1/10 chances for weapon change.
    func useHeal(healer: Caracter, target: Caracter) -> String
    {
        var healName = ""
        let rand = Int(arc4random_uniform(UInt32((10))))
        
        switch rand
        {
        case 0:
            let text = "...\n\(healer.newWeapon(caracter: healer))\n\(healer.name) uses "
            switch weapon.name
            {
            case "Staff":
                healing(target: target)
                healName = "healing"
            case "Wand":
                weakenedHealing(target: target)
                healName = "weakened healing"
            case "Sacred oak":
                superiorHealing(target: target)
                healName = "superior healing"
            case "Long staff":
                multHealing(target: (target as! Wizzard).team)
                healName = "multi healing"
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
            
            return text + healName
            
        default:
            switch weapon.name
            {
            case "Staff":
                healing(target: target)
                healName = "healing"
            case "Wand":
                weakenedHealing(target: target)
                healName = "weakened healing"
            case "Sacred oak":
                superiorHealing(target: target)
                healName = "superior healing"
            case "Long staff":
                multHealing(target: (target as! Wizzard).team)
                healName = "multi healing"
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
            return healName
        }
}
    
} // class Healing






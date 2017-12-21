//
//  IA.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 08/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

class IA: Player
{
    init()
    {
        super.init(name: Support.getIAName(), party: getRobotParty())
        askConfirmParty(IA: true)
    }
    
    
    
    
    
    private func getRobotParty() -> [Caracter]
    {
        var party = [Caracter]()
        var wizzard = false
        var allwizz = true
        
        for _ in 1...3
        {
            switch Int(arc4random_uniform(UInt32(3)))
            {
            case 0:
                party.append(Warrior(robot: true))
            case 1:
                party.append(Wizzard(robot: true))
            case 2:
                party.append(Giant(robot: true))
            case 3:
                party.append(Dwarf(robot: true))
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
        }
        
        for i in 0..<party.count
        {
            if party[i] is Wizzard
            {
                wizzard = true
            }
            if !(party[i] is Wizzard)
            {
                allwizz = false
            }
        }
        
        if !wizzard
        {
            let rand = Int(arc4random_uniform(UInt32(3)))
            party.remove(at: rand)
            party.insert(Wizzard(robot: true), at: rand)
        }
        if allwizz
        {
            let rand = Int(arc4random_uniform(UInt32(3)))
            switch rand
            {
            case 0:
                party.remove(at: rand)
                party.insert(Warrior(robot:true), at: rand)
            case 1:
                party.remove(at: rand)
                party.insert(Giant(robot:true), at: rand)
            case 2:
                party.remove(at: rand)
                party.insert(Dwarf(robot:true), at: rand)
            default:
                Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            }
        }
        
        for i in 0..<party.count
        {
            if party[i].caste == .wizzard
            {
                (party[i] as! Wizzard).team = party
            }
        }
        
        return party
    }
}



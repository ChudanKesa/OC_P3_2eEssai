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
    
    func chooseAttacker(i: Int) -> Int // choose Caracter whom attack
    {
        var select = 0
        
        if players[i].party.count > 1
        {
            print("Choose who is going to attack :")
            
            for j in 0..<players[i].party.count
            {
                print("\(j+1).", terminator: " "); caracterShow(caracter: players[i].party[j])
            }
            
            select = Support.secureInt(lowerLimit: 1, upperLimit: players[i].party.count)
        }
            
        else
        {
            select = 1
            switch players[i].lastOneStanding
            {
            case true:
                print("\(players[i].party[0].name) gives everything he has left !")
            case false:
                print("\(players[i].party[0].name) attacks !")
            }
        }
        
        return select
    }
    
    
    
    
    
    
    
    // easier to write and read
    private func caracterShow(caracter: Caracter)
    {
        caracter.symbol(caste: caracter); print(" \(caracter.name) - \(caracter.percent(life: caracter)) - \(caracter.weapon.name) : \(caracter.weapon.damage) damages")
    }
    
    
    
    
    
    
    /* when only one opponent remains, automaticly attacks him. Takes in account the fact that
     there may be lastOneStanding caracters on some teams and ignore them. */
    func autoTarget(i: Int) -> Caracter
    {
        var target = players[i].party[0]
        
        for y in 0..<players.count
        {
            if y != i
            {
                if !players[y].lastOneStanding && players[y].party[0].lifePoints > 0 //second condition made to avoid bugs when cheating
                {
                    target = players[y].party[0]
                }
            }
        }
        
        if target === players[i].party[0]
        {
            Support.errorLog(origin: "\(#file)", detail: "\(#line)")
            exit(1)
        }
        
        return target
    }
    
    
    
    
    
    
    func chooseTarget(i: Int) -> Caracter // choose whom to attack
    {
        var targetsRepository = [Caracter]()
        var select = 0
        
        print("Choose your target :")
        usleep(1 * 100 * 1000)
        for j in 0..<players.count
        {
            for y in 0..<players[j].party.count
            {
                if j != i && !players[j].lastOneStanding
                {
                    if players.count > 2
                    {
                        targetsRepository.append(players[j].party[y])
                        print("\(targetsRepository.count). \(players[j].name)'s \(players[j].party[y].name)", terminator: " "); players[j].party[y].symbol(caste: players[j].party[y]); print(players[j].party[y].percent(life: players[j].party[y]))
                        usleep(1 * 100 * 1000)
                    }
                    else
                    {
                        targetsRepository.append(players[j].party[y])
                        print("\(targetsRepository.count). \(players[j].party[y].name)", terminator: " "); players[j].party[y].symbol(caste: players[j].party[y]); print(players[j].party[y].percent(life: players[j].party[y]))
                        usleep(1 * 100 * 1000)
                    }
                }
            }
        }
        
        select = Support.secureInt(lowerLimit: 1, upperLimit: targetsRepository.count)
        
        return targetsRepository[select-1]
    }
    
    
    
    
    
    
    func attack(i: Int, target: Caracter, select: Int)
    {
        switch Int(arc4random_uniform(UInt32((2))))
        {
        case 0:
            print("\(players[i].party[select-1].newWeapon(caracter: players[i].party[select-1]))")
        case 1:
            break
        default:
            Support.errorLog(origin: "\(#file)", detail: "\(#line)")
        }
        
        players[i].party[select-1].attack(weapon: players[i].party[select-1].weapon, target: target)
    }
    
}


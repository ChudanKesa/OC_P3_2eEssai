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
                print("\(j+1).", terminator: " "); players[i].party[j].symbol(caste: players[i].party[j]); print(" \(players[i].party[j].name)")
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
    
    
    
    
    
    
    func autoTarget(i: Int) -> Caracter // when only one opponent remains, automaticly attacks him
    {
        var target = players[0].party[0]
        
        switch i
        {
        case 0:
            target = players[1].party[0]
        case 1:
            target = players[0].party[0]
        default:
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
                if j != i
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
            players[i].party[select-1].newWeapon(caracter: players[i].party[select-1])
        case 1:
            break
        default:
            Support.errorLog(origin: "\(#file)", detail: "\(#line)")
        }
        
        players[i].party[select-1].attack(weapon: players[i].party[select-1].weapon, target: target)
    }
    
}


//
//  LifePoints.swift
//  Projet3
//
//  Created by Erwan Le Querré on 29/10/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Caracter
{
    // show a caracter's life bar, with 50 '|'
    
    func lifeBar(caracter: Caracter)
    {
        var sign = "⚔"
        
        switch caracter.caste
        {
        case .warrior:
            sign = "⚔"
        case .wizzard:
            sign = "🔮"
        case .giant:
            sign = "👹"
        case .dwarf:
            sign = "🍺"
        default:
            Support.errorLog(origin: "Images", detail: "switch caracter.caste")
        }
        
        var actualLife = (((caracter.lifePoints)*100)/caracter.maxLifePoints)/2
        if actualLife <= caracter.maxLifePoints/50 && caracter.lifePoints != 0 {actualLife = 1}
        
        switch actualLife
        {
        case 1:
            print("   __________________________________________________")
            print("\(sign) |")
            print("   --------------------------------------------------")
            
        case 0:
            print("   __________________________________________________")
            print(sign)
            print("   --------------------------------------------------")
            
        default:
            print("   __________________________________________________")
            print(sign, terminator: " ")
            for _ in 1...actualLife
            {
                print("|", terminator: "")
            }
            print("\n   --------------------------------------------------")
        }
        
        print("\n", terminator: "")
        
    }
    

    
    
    
    // show a symbol based on caracter class so they're easier to identify in the game. Also, prettier menus.
    
    func symbol(caste: Caracter)
    {
        switch caste.caste
        {
        case .warrior:
            print("⚔", terminator: "")
        case .wizzard:
            print("🔮", terminator: "")
        case .giant:
            print("👹", terminator: "")
        case .dwarf:
            print("🍺", terminator: "")
        default:
            Support.errorLog(origin: "Images", detail: "func symbol -> switch")
        }
    }
    

    
    
    
    // same idea as lifeBar, to be used when little space is available.
    
    func percent(life: Caracter) -> String
    {
        let percent = life.lifePoints * 100 / life.maxLifePoints
        return "\(percent)%"
    }
    
    
    
}




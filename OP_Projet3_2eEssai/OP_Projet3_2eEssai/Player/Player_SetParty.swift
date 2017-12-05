//
//  Player_SetParty.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Player
{
    func setParty() -> [Caracter]
    {
        var auto = false
        var partyOK = false
        
        while !partyOK
        {
            intro()
            auto = autoSet()
            
            switch auto
            {
            case true:
                party = createRandParty()
            case false:
                party = createParty()
            }
            
            askConfirmParty()
            partyOK = doConfirmParty()
            
            if partyOK
            {
                wizzardSearch()
            }
        }
        
        return party
    }
    
    
    
    
    
    // text to get players started
    private func intro()
    {
        sleep(1)
        print("""
            \n\(name), it's your turn.
            You will now select 3 heroes to fight for you.\n
            """)
        usleep(15 * 100 * 1000)
        print("Do you want a random party ? Y/N")
    }
    
    
    
    
    
    // setting of auto
    private func autoSet() -> Bool
    {
        var auto = true
        
        switch Support.askYN()
        {
        case "y":
            auto = true
        case "Y":
            auto = true
        case "n":
            auto = false
        case "N":
            auto = false
        default:
            Support.errorLog(origin: "\(#file)", detail: "\(#line)")
        }
        
        return auto
    }
    
    
    
    
    
    // creates random party of 3
    private func createRandParty() -> [Caracter]
    {
        var party = [Caracter]()
        
        for _ in 1...3
        {
            switch Int(arc4random_uniform(UInt32((4)))) + 1
            {
            case 1:
                party.append(Warrior(auto: true))
            case 2:
                party.append(Wizzard(auto: true))
            case 3:
                party.append(Giant(auto: true))
            case 4:
                party.append(Dwarf(auto: true))
            default:
                Support.errorLog(origin: "Players", detail: "\(#line) switch")
            }
        }
        return party
    }
    
    
    
    
    
    // lets players choose their party.
    private func createParty() -> [Caracter]
    {
        var party = [Caracter]()
        
        for i in 1...3
        {
            print("Choose your caracter n°\(i) :")
            usleep(12 * 100 * 1000)
            print("1. A Warrior. ⚔")
            print(Caracter.caracterDescription(caste: .warrior))
            usleep(10 * 100 * 1000)
            print("2. A Wizzard. 🔮")
            print(Caracter.caracterDescription(caste: .wizzard))
            usleep(10 * 100 * 1000)
            print("3. A Giant. 👹")
            print(Caracter.caracterDescription(caste: .giant))
            usleep(10 * 100 * 1000)
            print("4. A Dwarf. 🍺")
            print(Caracter.caracterDescription(caste: .dwarf))
            
            switch Support.secureInt(lowerLimit: 1, upperLimit: 4)
            {
            case 1:
                party.append(Warrior())
            case 2:
                party.append(Wizzard())
            case 3:
                party.append(Giant())
            case 4:
                party.append(Dwarf())
            default:
                Support.errorLog(origin: "Players", detail: "\(#line) switch")
            }
        } // for i 1...3
        
        return party
    }
}



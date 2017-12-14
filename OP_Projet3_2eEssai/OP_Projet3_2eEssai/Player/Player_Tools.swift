//
//  Player_Tools.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Player
{
    // recaps party and asks confirmation
    func askConfirmParty(IA: Bool)
    {
        usleep(1 * 100 * 1000)
        if IA
        {print("\(name), welcome to existence."); usleep(1*1000*1000)}
        print("Your warriors has been chosen. You will fight with ")
        usleep(10 * 100 * 1000)
        for i in 1...3
        {
            switch i
            {
            case 1:
                print("\(party[i-1].name), \(party[i-1].adressCaracter(caracter: party[i-1]))")
                usleep(9 * 100 * 1000)
            case 2:
                print("\(party[i-1].name), \(party[i-1].adressCaracter(caracter: party[i-1]))")
                usleep(9 * 100 * 1000)
            case 3:
                print("and \(party[i-1].name), \(party[i-1].adressCaracter(caracter: party[i-1])).")
                usleep(9 * 100 * 1000)
            default:
                Support.errorLog(origin: "Players", detail: "Switch 'i' would not read")
            }
        }
        if !IA
        {
            print("Is that correct ?\nY/N")
        }
    }
    
    
    
    
    
    // text to show if party is either confirmed or cancelled + void of selected party
    func doConfirmParty() -> Bool
    {
        switch Support.askYN()
        {
        case "Y":
            usleep(1 * 100 * 1000)
            print("\n\tYour party has been decided. May the odds ever be with you.\n")
            usleep(20 * 100 * 1000)
            return true
        case "y":
            print("\n\tYour party has been decided. May the odds ever be with you.\n")
            usleep(10 * 100 * 1000)
            return true
        case "N":
            print("Let us try again.")
            usleep(1 * 100 * 1000)
            for _ in 0..<party.count
            {
                party.remove(at: 0)
            }
            for _ in 1...3
            {
                Support.names.append(Support.caractersNames[0])
                Support.caractersNames.remove(at: 0)
            }
            return false
        case "n":
            print("Let us try again.")
            usleep(1 * 100 * 1000)
            for _ in 0..<party.count
            {
                party.remove(at: 0)
            }
            for _ in 1...3
            {
                Support.names.append(Support.caractersNames[0])
                Support.caractersNames.remove(at: 0)
            }
            return false
        default:
            Support.errorLog(origin: "Players", detail: "\(#line) switch")
            return false
        }
    }
    
    
    
    
    
    // makes note of how many wizzard and where there are.
    func wizzardSearch()
    {
        for i in 0..<party.count
        {
            if party[i].caste == .wizzard
            {
                (party[i] as! Wizzard).team = party
            }
        }
    }
}


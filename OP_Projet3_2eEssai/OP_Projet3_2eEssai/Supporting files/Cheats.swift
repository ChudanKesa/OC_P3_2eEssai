//
//  Cheats.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 05/12/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Support
{
    static var cheated = [Player]()
    
    static func snitch(on players: [Player])
    {
        cheated.removeAll()
        cheated = players
    }
    
    
    static func cheat() // now that the game works and i just have to change a few minor things, testing is WAY TOO LONG
    {
        print("*************************")
        print("\tWELCOME to the cheat area.\n")
        
        
        var tab = [Caracter]()
        var select = Int()
        var alsoselect = Int()
        var number = 1
        var multiSelect = [Int]()
        
        if cheated.count == 1
        {
            print("\n\tNothing to be done.\n")
        }
            
        else
        {
            print("Wich caracter's life shall we modify ?")
            for i in 0..<cheated.count
            {
                for j in 0..<cheated[i].party.count
                {
                    print("\(number). \(cheated[i].name)'s \(cheated[i].party[j].caste.rawValue) : \(cheated[i].party[j].name)", terminator: " "); cheated[i].party[j].symbol(caste: cheated[i].party[j]); print("- \(cheated[i].party[j].lifePoints) LP")
                    tab.append(cheated[i].party[j])
                    number += 1
                }
            }
            print("\(number). Multiple selection\n\(number+1). EVERYONE")
            
            select = askForInt(lowerLimit: 1, upperLimit: tab.count+2)
            
            
            if select == tab.count+1
            {
                var keepGoing = true
                while keepGoing
                {
                    select = askForInt(lowerLimit: 1, upperLimit: tab.count+1)
                    if select == tab.count+1 {keepGoing = false}
                    else {multiSelect.append(select)}
                }
                print("How many LP do you want ?")
                alsoselect = askForInt(lowerLimit: 0, upperLimit: 1000)
                for i in 0..<multiSelect.count
                {
                    tab[multiSelect[i]-1].lifePoints = alsoselect
                }
            }
            else if select == tab.count+2
            {
                print("How many LP do you want ?")
                alsoselect = askForInt(lowerLimit: 0, upperLimit: 1000)
                for i in 0..<cheated.count
                {
                    for j in 0..<cheated[i].party.count
                    {
                        cheated[i].party[j].lifePoints = alsoselect
                    }
                }
            }
            else
            {
                print("How many LP do you want ?")
                alsoselect = askForInt(lowerLimit: 0, upperLimit: 1000)
                tab[select - 1].lifePoints = alsoselect
            }
            
            print("\n\tDone.\n")
        }
    }
}


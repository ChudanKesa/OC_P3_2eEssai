//
//  Weapon.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

class Weapon // class that defines how many damage a caracter does. Depends on class.
{
    let name: String
    let damage: Int
    
    init(name: String, damage: Int)
    {
        self.name = name
        self.damage = damage
    }
    
    convenience init()
    {
        self.init(name: "Bare Hands", damage: 3)
    }
    
    //////////////////////////////////////////////////////////
    // MARK: METHODS
    //////////////////////////////////////////////////////////
    
    // permits correct use of "a/an" as per weapon name.
    
    func adressWeapon(weapon: Weapon) -> String
    {
        if weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "A" ||
            weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "O" ||
            weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "I" ||
            weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "E" ||
            weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "U" ||
            weapon.name[weapon.name.index(weapon.name.startIndex, offsetBy: 0)] == "Y"
        {
            return "an \(weapon.name)"
        }
            
        else
        {
            return "a \(weapon.name)"
        }
    }
}


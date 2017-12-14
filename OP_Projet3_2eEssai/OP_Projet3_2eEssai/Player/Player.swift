//
//  Player.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//’

import Foundation

class Player
{
    var party = [Caracter]()
    var lastOneStanding = false
    var name: String
    
    
    init(name: String, party: [Caracter])
    {
        self.name = name
        self.party = party
    }
    
    init(name: String)
    {
        self.name = name
        self.party = setParty()
    }
}


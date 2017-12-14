//
//  main.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

var keepGoing = true

/*while keepGoing
 {
 let game = Game()
 keepGoing = game.finishGame()
 }*/

let robot = IA()
print("\(robot.name)\n")

for i in 1...3
{
    print("\(robot.party[i-1].name)")
}

print("\n\(robot.party.count)")

//
//  ErrorsLog.swift
//  OP_Projet3_2eEssai
//
//  Created by Erwan Le Querré on 29/11/2017.
//  Copyright © 2017 Erwan Le Querré. All rights reserved.
//

import Foundation

extension Support
{
    static func errorLog(origin: String, detail: String)
    {
        print("**************************************")
        print("\tError in file \(origin) : '\(detail)'.")
        print("**************************************")
    }
}


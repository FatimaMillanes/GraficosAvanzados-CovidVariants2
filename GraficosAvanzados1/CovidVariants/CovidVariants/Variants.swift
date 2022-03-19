//
//  Variants.swift
//  CovidVariants
//
//  Created by Alumno on 1/21/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import Foundation

class Variants : Decodable{
    
    var lineage : String?
    var earliest_date : String?
    var designated_number : String?
    var assigned_number : String?
    var who_name : String?
    
    /*init(lineage: String, date: String, designated: String, assigned: String, name: String) {
        self.lineage = lineage
        self.earliest_date = date
        self.designated_number = designated
        self.assigned_number = assigned
        self.who_name = name
        
    }*/
}

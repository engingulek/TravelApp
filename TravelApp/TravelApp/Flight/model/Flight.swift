//
//  FlightModel.swift
//  TravelApp
//
//  Created by engin gülek on 3.06.2023.
//

import Foundation


struct Flight : Identifiable {
   
    
    var id : Int
    var city : City
    var country : String
    
}

struct City :Identifiable {
    var id : Int
    var name : String
    var code : String
    var airport : [Airport]
}

struct Airport : Identifiable {
    var id : Int
    var name : String
    var code : String
}

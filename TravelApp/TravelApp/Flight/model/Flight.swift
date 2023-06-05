//
//  FlightModel.swift
//  TravelApp
//
//  Created by engin gülek on 3.06.2023.
//

import Foundation


struct Flight : Codable {
   
    
    var _id : String
    var city : City
    var country : String
    
}

struct City :Identifiable, Codable,Equatable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id : Int
    var name : String
    var code : String
    var airport : [Airport]
}

struct Airport : Identifiable , Codable {
    var id : Int
    var name : String
    var code : String
}

//
//  FlightTicket.swift
//  TravelApp
//
//  Created by engin gülek on 8.06.2023.
//

import Foundation

struct FlightTicket : Codable{
    var _id : String
    var airline : String
    var from : Info
    var to : Info
    var date: String
    var deptureClock: String
    var arrivelClock : String
    var classType: String
    var price : Int
    var bagWeight: Int
}

struct Info : Codable {
    var city : String
    var airport : Airport
    var country : String
}

//
//  Network.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation
enum Network {
    case flights
    case popFlights
    case flightTickets
}


extension Network : TargetType {
    var baseUrl: String {
        return "http://localhost:3000"
    }
    
    var path: String {
        switch self {
            
        case .flights:
            return "/flights"
        case .popFlights:
            return "/allPopFlights"
        case .flightTickets:
            return "/flightTickets"
        }
    }
    
    var method: Method {
        switch self {
            
        case .flights:
            return .get
        case .popFlights:
            return .get
        case .flightTickets:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
            
        case .flights:
            return .requestPlain
        case .popFlights:
            return .requestPlain
        case .flightTickets:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
   
    
}

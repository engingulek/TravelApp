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
        }
    }
    
    var method: Method {
        switch self {
            
        case .flights:
            return .get
        case .popFlights:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
            
        case .flights:
            return .requestPlain
        case .popFlights:
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

//
//  Network.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation
enum Network {
    case flights
}


extension Network : TargetType {
    var baseUrl: String {
        return "http://localhost:3000"
    }
    
    var path: String {
        switch self {
            
        case .flights:
            return "/flights"
        }
    }
    
    var method: Method {
        switch self {
            
        case .flights:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
            
        case .flights:
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

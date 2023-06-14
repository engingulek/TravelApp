//
//  RequestType.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation


enum Method : String {
    case get = "GET"
}


enum RequestType {
    case requestPlain
}




protocol TargetType {
    var baseUrl : String {get}
    var path : String {get}
    var method : Method {get}
    var requestType : RequestType {get}
    var headers : [String:String]? {get}
}

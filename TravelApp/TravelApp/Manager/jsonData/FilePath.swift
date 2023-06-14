//
//  Path.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation


protocol JsonTargetType {
    var filePath:String {get}
}


enum JsonData {
    case countryPhonecode
}


extension JsonData : JsonTargetType {
    var filePath: String {
        switch self {
        case .countryPhonecode:
            return "countryPhoneCode"
        }
    }
}





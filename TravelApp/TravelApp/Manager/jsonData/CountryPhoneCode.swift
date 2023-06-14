//
//  CountryPhoneCode.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation



struct  CountryPhoneCode : Codable,Hashable {
    let name : String
    let dial_code: String
    let code : String
    let defaultType:String
}



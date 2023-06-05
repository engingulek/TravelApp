//
//  DataResult.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation
struct DataResult<T:Codable> : Codable {
    var list: [T]
    var success : Int
}

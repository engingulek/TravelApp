//
//  Extension+FlightViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 13.06.2023.
//

import Foundation

//MARK: - Search Error

enum SearchError : LocalizedError {
    case emptyFromLocation
    case emptyToLocation
    case fromToLoctionCompare
    
    var errorDescription: String? {
        switch self {
            
        case .emptyFromLocation:
          return  "Please select departure location"
        case .emptyToLocation:
          return "Please select arrivel location"
        case .fromToLoctionCompare:
            return "Please select a different city than the departure flight"
        }
    }
}


extension FlightViewModel {
    func fromLocationControl(_ from:String) throws  {
        // Departure location not selected
        guard from != "City/Airport" else {throw SearchError.emptyFromLocation}
        
    }
    // Arrivel location not selected
    func toLocationControl(_ to:String) throws  {
        guard to != "City/Airport" else {throw SearchError.emptyToLocation}
        
    }
    
    // Same departure and arrivel
    func fromToLocationCompare(_ from:City,_ to:City) throws {
        guard from.id != to.id else {throw SearchError.fromToLoctionCompare}
    }
}

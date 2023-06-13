//
//  ClassViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation


enum ClassType : String,CaseIterable,Identifiable{
    var id : String { UUID().uuidString }
    
    case economy = "Economy"
    case business = "Business"
}

enum TimesOfDay : String,CaseIterable,Identifiable {
    var id : String {UUID().uuidString}
    case morning = "Morning"
    case afternoon = "Afternoon"
    case evening = "Evening"
    case night = "Night"
}

class FilterViewModel : ObservableObject {
    @Published var selectedClassType : ClassType?
    @Published var selectedTimesOfDay : TimesOfDay?
    var flightList = [FlightVM]()
    @Published var filterList  = [FlightVM]()
     var flightViewModel = FlightViewModel()
    
    
    func filterFlightList(){
        print("Count \(flightViewModel.resutlFlight.count)")
    }
}

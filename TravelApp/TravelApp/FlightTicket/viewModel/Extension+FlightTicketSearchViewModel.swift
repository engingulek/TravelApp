//
//  Extension+FlightTicketSearchViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 13.06.2023.
//

import Foundation
enum ClassType : String,CaseIterable,Identifiable{
    var id : String { UUID().uuidString }
    
    case economy = "Economy"
    case business = "Business"
}

enum TimesOfDay : String,CaseIterable {
    
    case morning = "Morning"
    case afternoon = "Afternoon"
    case evening = "Evening"
    case night = "Night"
}



extension FlightTicketSearchViewModel   {
    
  
    
    func filterFlightList() {
    
        let list = self.tempFligjtTicDepList
        if self.selectedTimesOfDay == nil {
            self.flightTicketsDepture = list.filter{$0.classType == self.selectedClassType!.rawValue}
        }else if self.selectedClassType == nil {
            self.flightTicketsDepture = list.filter{$0.timesOfDay == self.selectedTimesOfDay}
        }else{
            self.flightTicketsDepture = list.filter {
                $0.classType == self.selectedClassType!.rawValue &&
                $0.timesOfDay == self.selectedTimesOfDay
            }
        }
        
        
        
        
        
      
        

    }
}

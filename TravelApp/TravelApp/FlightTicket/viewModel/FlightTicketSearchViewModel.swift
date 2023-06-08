//
//  FlightTicketViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation

enum FlightTicketSearchError : LocalizedError {
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

final
class FlightTicketSearchViewModel : ObservableObject {
   private var flightTicketService = FlightTicketService()
    @Published var flightTickets : [FlightTicketVM] = []
 
    
    
    func getFlightInfo(fromCode:String,
                       toCode:String,
                       depatureDate:String,
                       passenger:Int,classType:String){
        
        print(fromCode)
        print(toCode)
        print(depatureDate)
        print(passenger)
        print(classType)
        
    }
    
    func getFlightInfo(fromCode:String,
                       toCode:String,
                       depatureDate:String,
                       arrivelDate:String = "",
                       passenger:Int,classType:String){
        
        print(fromCode)
        print(toCode)
        print(depatureDate)
        print(arrivelDate)
        print(passenger)
        print(classType)
        
    }
    
    
    func getDataFlightTickets() async {
        do {
            await flightTicketService.getFlightTickets(completion: { (response:Result<[FlightTicket],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        self.flightTickets = list.map(FlightTicketVM.init)
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.flightTickets = []
                    }
                }
            })
        }
    }
}

struct FlightTicketVM: Identifiable {
    let flightTicket : FlightTicket
    var id : String {
        flightTicket._id
    }
    var airline : String {
        flightTicket.airline
    }
    
    var from : Info {
        flightTicket.from
    }
    var to : Info {
        flightTicket.to
    }
    var date: String {
        flightTicket.date
    }
    var deptureClock: String{
        flightTicket.deptureClock
    }
    var arrivelClock : String {
        flightTicket.arrivelClock
    }
    var classType: String {
        flightTicket.classType
    }
    var price : Int {
        flightTicket.price
    }
    var bagWeight: Int {
        flightTicket.bagWeight
    }
}


extension FlightTicketSearchViewModel {
    func fromLocationControl(_ from:String) throws  {
        guard from != "City/Airport" else {throw FlightTicketSearchError.emptyFromLocation}
        
    }
    
    func toLocationControl(_ to:String) throws  {
        guard to != "City/Airport" else {throw FlightTicketSearchError.emptyToLocation}
        
    }
    
    func fromToLocationCompare(_ from:City,_ to:City) throws {
        guard from.id != to.id else {throw FlightTicketSearchError.fromToLoctionCompare}
    }
}

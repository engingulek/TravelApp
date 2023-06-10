//
//  FlightTicketViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation



final
class FlightTicketSearchViewModel : ObservableObject {
   private var flightTicketService = FlightTicketService()
    @Published var flightTickets : [FlightTicketVM] = []
    @Published var getDeptureDate : Date?
    @Published var dateList = [Date]()
    
  
    
    func getDataFlightTickets() async {
        do {
            await flightTicketService.getFlightTickets(completion: { (response:Result<[FlightTicket],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        
                        let resultList =  list.map(FlightTicketVM.init)
                        self.flightTickets = resultList
                        
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.flightTickets = []
                    }
                }
            })
        }
    }
    
    
    func listDateLater20(){

        let currentDate = Date.now
        print("List Date Later \(currentDate)")
        print(Date.now)
        
       
        var datecomponent = DateComponents()
        for addDate in 0..<30 {
            datecomponent.day = addDate
            let futureCalender = Calendar.current.date(byAdding: datecomponent, to: currentDate)
            guard let futureDate = futureCalender else {return}
            dateList.append(futureDate)
            
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
    var price : [PriceInfo] {
        flightTicket.price
    }
    var bagWeight: Int {
        flightTicket.bagWeight
    }
}




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
    @Published var flightTicketsDepture : [FlightTicketVM] = []
    @Published var getDeptureDate : Date?
    @Published var dateList = [Date]()
    var deptureDate:Date?
    var returnDate:Date?
    var deptureCity : City?
    var arrivelCity: City?
    var classType : String?
    var passangerList: [String:Int]?
    
    
    
  
    
    func getDataDeptureFlightTickets() async {
        do {
            await flightTicketService.getFlightTickets(completion: { (response:Result<[FlightTicket],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        let resultList =  list.map(FlightTicketVM.init)
                        self.flightTicketsDepture =  resultList.filter{ result in
                            self.deptureCity!.airport.contains(where: {$0.code == result.from.airport.code})
                            &&   self.arrivelCity!.airport.contains(where: {$0.code == result.to.airport.code})
                            && self.getDeptureDate!.dateFormatted() == result.date.stringToDate().dateFormatted()
                            && self.classType! == result.classType
                        }
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.flightTicketsDepture = []
                    }
                }
            })
        }
    }
    
    //MARK: - Calculate total amount
    func calculateTotalAmount(_ priceInfo:[PriceInfo]) -> String {
        
        var totalAmount = 0.0
        for info in priceInfo {
            //print("PassengerList \(passangerList[i])")
           // print(info.person.capitalized)
            totalAmount += Double(info.price) * Double(passangerList![info.person.capitalized] ?? 0)
           // print("ali \(passangerList![info.person])")
        }
        
       /* print(passangerList)
        print(priceInfo)*/
        return String(format: "%.1f", totalAmount)
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




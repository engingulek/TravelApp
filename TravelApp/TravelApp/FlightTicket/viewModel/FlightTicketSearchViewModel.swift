//
//  FlightTicketViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation

class FlightTicketSearchViewModel : ObservableObject {
    private var flightTicketService = FlightTicketService()
    @Published var flightTicketsDepture : [FlightTicketVM] = []
    @Published var flightTicketReturn : [FlightTicketVM] = []
    @Published var tempFlightTicDepList : [FlightTicketVM] = []
    @Published var tempFlightTicRetrunList : [FlightTicketVM] = []
    @Published var getDeptureDate : Date?
    @Published var getReturnDate : Date?
    @Published var dateList = [Date]()
    @Published var selectedClassType : ClassType?
    @Published var selectedTimesOfDay : TimesOfDay?
    @Published var selectedDeptureTicket : FlightTicketVM?
    

   
    
    var deptureDate:Date?
    var returnDate:Date?
    var deptureCity : City?
    var arrivelCity: City?
    var passangerList: [String:Int]?
    var flightList = [FlightVM]()

    
     func getDataDeptureFlightTickets() async   {
         do{
             await flightTicketService.getFlightTickets(completion: { (response:Result<[FlightTicket],Error>) in
                  switch response {
                  case .success(let list):
                      DispatchQueue.main.async {
                          let flightList =  list.map(FlightTicketVM.init)
                          let resultList =  flightList.filter{ result in
                              self.deptureCity!.airport.contains(where: {$0.code == result.from.airport.code})
                              && self.arrivelCity!.airport.contains(where: {$0.code == result.to.airport.code})
                              && self.getDeptureDate!.dateFormatted() == result.date.stringToDate().dateFormatted()
                              && Date.now.formatted(.dateTime.hour().minute()).stringToClock().add30MinuteClock() <
                                result.deptureClock.stringToClock()
                            
                          }
                          self.flightTicketsDepture = resultList
                          self.tempFlightTicDepList = resultList

                      }
                  case .failure(_):
                      DispatchQueue.main.async {
                          self.flightTicketsDepture = []
                      }
                  }
              })
         }
    }
     
     func getDataReturnFlightTickets() async{
        
         do{
             await flightTicketService.getFlightTickets(completion: { (response:Result<[FlightTicket],Error>) in
                  switch response {
                  case .success(let list):
                      DispatchQueue.main.async {
                          let flightList =  list.map(FlightTicketVM.init)
                          let resultList =  flightList.filter{ result in
                              self.arrivelCity!.airport.contains(where: {$0.code == result.from.airport.code})
                              &&   self.deptureCity!.airport.contains(where: {$0.code == result.to.airport.code})
                              && self.getReturnDate!.dateFormatted() == result.date.stringToDate().dateFormatted()
                              && self.selectedDeptureTicket!.arrivelClock.stringToClock().add30MinuteClock() < result.deptureClock.stringToClock()
                          }
                          
                          self.flightTicketReturn = resultList
                          self.tempFlightTicRetrunList = resultList
                         
                          
                          
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
            totalAmount += Double(info.price) * Double(passangerList![info.person.capitalized] ?? 0)
        }
        return String(format: "%.1f", totalAmount)
        
    }
     
     
     func listDateLater30(forCurrentDate date : Date) {
         dateList = []
         let currentDate = date
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
    var timesOfDay : TimesOfDay {
        if 5 <= Int(flightTicket.deptureClock.splitTime())! && Int(flightTicket.deptureClock.splitTime())! < 12 {
            return .morning
        } else if  12 <= Int(flightTicket.deptureClock.splitTime())! && Int(flightTicket.deptureClock.splitTime())! < 16{
            return .afternoon
        } else if  16 <= Int(flightTicket.deptureClock.splitTime())! && Int(flightTicket.deptureClock.splitTime())! < 20{
            return .evening
        } else{
            return .night
        }
    }
}




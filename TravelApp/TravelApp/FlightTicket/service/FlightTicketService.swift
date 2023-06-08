//
//  FlightTicketService.swift
//  TravelApp
//
//  Created by engin gülek on 8.06.2023.
//

import Foundation

protocol FlightTicketServiceProtocol {
    func getFlightTickets(completion:@escaping(Result<[FlightTicket],Error>)->()) async
}

class FlightTicketService : FlightTicketServiceProtocol {
    private var serviceManager = ServiceManager()
    
    func getFlightTickets(completion: @escaping (Result<[FlightTicket], Error>) -> ()) async {
        do{
            serviceManager.fetch(target: .flightTickets) { (response:Result<[FlightTicket]?,Error>) in
                switch response {
                
                case .success(let list):
                    completion(.success(list!))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    
}

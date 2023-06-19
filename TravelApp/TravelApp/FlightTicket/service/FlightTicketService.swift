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
    
    
    
    
    
    func getFlightTickets(completion: @escaping (Result<[FlightTicket], Error>) -> ()) {
        Task {
            do{
                let result = try await getFlightTickets()
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
    }
    
    
    private func getFlightTickets() async throws -> [FlightTicket]{
        return try await withCheckedThrowingContinuation{ continuation in
            DispatchQueue.main.async {
                self.serviceManager.fetch(target: .flightTickets) { (response:Result<[FlightTicket]?,Error>) in
                    switch response {
                    
                    case .success(let list):
                        continuation.resume(returning: list!)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    
}

//
//  FlightService.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation

protocol FlightServiceProtocol {
    func getCityOrAirport(completion:@escaping(Result<[Flight],Error>)->()) async
    func getPopCity(completion:@escaping(Result<[Flight],Error>)->()) async
}


class FlightService : FlightServiceProtocol {
    
    private var serviceManager = ServiceManager()
    
    
    func getCityOrAirport(completion: @escaping (Result<[Flight], Error>) -> ()) {
        Task{
            do{
                let result = try await getCityOrAirport()
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
    }
    
    func getPopCity(completion: @escaping (Result<[Flight], Error>) -> ()) {
        Task{
            do{
                let result = try await getPopCity()
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - GetFlights
   private func getCityOrAirport() async throws -> [Flight] {
        return try await withCheckedThrowingContinuation{ continuation in
            DispatchQueue.main.async {
                self.serviceManager.fetch(target: .flights) { (response:Result<[Flight]?,Error>) in
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
    
    // MARK: GetPopFlight
   private func getPopCity() async throws -> [Flight] {
       return try await withCheckedThrowingContinuation{ continuation in
           DispatchQueue.main.async {
               self.serviceManager.fetch(target: .popFlights) { (response:Result<[Flight]?,Error>) in
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

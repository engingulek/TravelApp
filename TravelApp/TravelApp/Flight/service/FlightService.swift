//
//  FlightService.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation

protocol FlightServiceProtocol {
    func getFlights(completion:@escaping(Result<[Flight],Error>)->()) async
}


class FlightService : FlightServiceProtocol {
    private var serviceManager = ServiceManager()
    func getFlights(completion: @escaping (Result<[Flight], Error>) -> ()) async {
        do{
            serviceManager.fetch(target: .flights) { (response:Result<[Flight]?,Error>) in
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

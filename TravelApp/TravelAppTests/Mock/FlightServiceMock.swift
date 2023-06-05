//
//  NetworkSessionMock.swift
//  TravelAppTests
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation
@testable import TravelApp

class FlightServiceMock : FlightServiceProtocol {
    let serviceManager = ServiceManager()
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

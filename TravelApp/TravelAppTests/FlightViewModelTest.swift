//
//  FlightViewModelTest.swift
//  TravelAppTests
//
//  Created by engin gülek on 5.06.2023.
//

import XCTest
@testable import TravelApp
final class FlightViewModelTest: XCTestCase {

    var flightViewModel : FlightViewModel!
    var flightServiceMock : FlightServiceMock!
    var urlSession : URLSession!
    
    override  func setUp() {
        super.setUp()
        flightViewModel = FlightViewModel()
        flightServiceMock = FlightServiceMock()
        urlSession = URLSession(configuration: .default)
    }
    
    override  func tearDown() {
        flightViewModel = nil
        flightServiceMock = nil
        urlSession = nil
        super.tearDown()
        
    }
    

    func test_getFlights_HTTPStatusCode200() throws {
    
       let urlString = "http://localhost:3000/flights"
        let url = URL(string: urlString)!
        let promise = expectation(description: "Status code: 200")
        let dataTask = urlSession.dataTask(with: url){_,response,error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                     return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                }else{
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
    
    
    
   
    


}

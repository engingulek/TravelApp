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
 
    var urlSession : URLSession!
    
    override  func setUp() {
        super.setUp()
        flightViewModel = FlightViewModel()
    
        urlSession = URLSession(configuration: .default)
    }
    
    override  func tearDown() {
        flightViewModel = nil
 
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
    
    
    func test_getPopFlights_HTTPStatusCode200() throws {
    
       let urlString = "http://localhost:3000/allPopFlights"
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
    
    func test_selectedChangeButton_changeFromAndTo(){
        flightViewModel.selectedDepature = City(id: 1,
                                                name: "İstanbul",
                                                code: "ISTA",
                                                airport:
                                                    [.init(id: 1,
                                                           name: "Sabiha Gökçen Havalimanı",
                                                           code: "SAW")])
        flightViewModel.selectedArrivel = City(id: 1,
                                               name: "Ankara",
                                               code: "ESB",
                                               airport:
                                                   [.init(id: 2,
                                                          name: "Esenboğa Havalimanı",
                                                          code: "ESB")])
        flightViewModel.changeFromAndTo()
        
        XCTAssertEqual(flightViewModel.selectedDepature, flightViewModel.selectedArrivel)
        XCTAssertEqual(flightViewModel.textSelectedDepature, flightViewModel.textSelectedArrivel)
    }
    
    
    
   
    


}

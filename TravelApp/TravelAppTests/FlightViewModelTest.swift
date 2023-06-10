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
    
    func test_with_getFlight_network_is_valid(){
        let flight = Network.flights
        
        let  method = flight.method.rawValue
        let path = flight.path
        let url = flight.baseUrl + flight.path

        XCTAssertEqual(method, "GET","The method type should be GET")
        XCTAssertEqual(path, "/flights","The path type should be /flights")
        XCTAssertEqual(url, "http://localhost:3000/flights","The path type should be http://localhost:3000/flights")
        
    }
    
    func test_with_getPopFlights_network_is_valid(){
        let popFlight = Network.popFlights
        
        let method = popFlight.method.rawValue
        let path = popFlight.path
        let url = popFlight.baseUrl + popFlight.path


        XCTAssertEqual(method, "GET","The method type should be GET")
        XCTAssertEqual(path, "/allPopFlights","The path type should be /allPopFlights")
        XCTAssertEqual(url, "http://localhost:3000/allPopFlights","The path type should be http://localhost:3000/allPopFlights")
        
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
    
    func test_is_from_select(){
        XCTAssertNoThrow(try flightViewModel.fromLocationControl("İstanbul/Sabiha Gökçen"))
    }
    
    func test_is_to_select(){
        XCTAssertNoThrow(try flightViewModel.fromLocationControl("İstanbul/Esenboğa Havalimanı"))
    }
    
    func test_is_toFrom_Compare(){
        let from = City(id: 1, name: "İstanbul", code: "IST", airport: [Airport(id: 2, name: "Sabiha Gökçen", code: "SAW")])
        let to = City(id: 2, name: "Ankara", code: "ESB", airport: [Airport(id: 2, name: "Esenboğa Havalimanı", code: "ESB")])
        
        XCTAssertNoThrow(try flightViewModel.fromToLocationCompare(from, to))
    }
    
    
    
   
    


}

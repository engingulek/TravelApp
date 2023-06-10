//
//  FlightTicketSearchViewModelUnitTest.swift
//  TravelAppTests
//
//  Created by engin gülek on 7.06.2023.
//

import XCTest
@testable import TravelApp
final class FlightTicketSearchViewModelUnitTest: XCTestCase {

    var flightTicket :  FlightTicketSearchViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        flightTicket = FlightTicketSearchViewModel()
        
    }

    override func tearDownWithError() throws {
        flightTicket = nil
        try super.tearDownWithError()
    }

    func test_with_flightTickets_network_is_valid(){
        let flightTicket = Network.flightTickets
        
        let method = flightTicket.method.rawValue
        let path = flightTicket.path
        let url = flightTicket.baseUrl + flightTicket.path

        XCTAssertEqual(method, "GET","The method type should be GET")
        XCTAssertEqual(path, "/flightTickets","The path type should be /flightTickets ")
        XCTAssertEqual(url, "http://localhost:3000/flightTickets","The path type should be http://localhost:3000/flightTickets")
        
    }
    
   
    
   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

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

    func test_is_from_select(){
        XCTAssertNoThrow(try flightTicket.fromLocationControl("İstanbul/Sabiha Gökçen"))
    }
    
    func test_is_to_select(){
        XCTAssertNoThrow(try flightTicket.fromLocationControl("İstanbul/Esenboğa Havalimanı"))
    }
    
    func test_is_toFrom_Compare(){
        let from = City(id: 1, name: "İstanbul", code: "IST", airport: [Airport(id: 2, name: "Sabiha Gökçen", code: "SAW")])
        let to = City(id: 2, name: "Ankara", code: "ESB", airport: [Airport(id: 2, name: "Esenboğa Havalimanı", code: "ESB")])
        
        XCTAssertNoThrow(try flightTicket.fromToLocationCompare(from, to))
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

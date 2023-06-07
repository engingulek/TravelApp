//
//  SelectedPassengerViewModelTest.swift
//  TravelAppTests
//
//  Created by engin gülek on 7.06.2023.
//

import XCTest
@testable import TravelApp
final class SelectedPassengerViewModelTest: XCTestCase {

    var selectedPassangerViewModel : SelectPassengerViewModel!
    override func setUp()  {
       super.setUp()
        selectedPassangerViewModel =  SelectPassengerViewModel()
        
    }

    override func tearDown()  {
        selectedPassangerViewModel = nil
        super.tearDown()
    }

    func test_passengerCount() {
        let expecetedAdult = selectedPassangerViewModel.passengerCount(passenger: PassagersType.adult)
        
        XCTAssertEqual(expecetedAdult, 1)
        
        
        let expecetedKind = selectedPassangerViewModel.passengerCount(passenger: PassagersType.kind)
         
         XCTAssertEqual(expecetedKind, 0)
        
        
        
        let expecetedBaby = selectedPassangerViewModel.passengerCount(passenger: PassagersType.baby)
         
         XCTAssertEqual(expecetedBaby, 0)
        
        
        let expecetedStudent = selectedPassangerViewModel.passengerCount(passenger: PassagersType.student)
         
         XCTAssertEqual(expecetedStudent, 0)
    }
    
    
    func test_IncreasePassengerCountAdult_return2() {
        selectedPassangerViewModel.toIncreasePassengerCount(passenger: .adult)
        let expected = selectedPassangerViewModel.adultCount
        XCTAssertEqual(expected, 2)
    }
    
    func test_DecreasePassengerCoun_Adult_Resturn1(){
        selectedPassangerViewModel.toDecreasePassengerCount(passenger: .adult)
        let expected = selectedPassangerViewModel.adultCount
        XCTAssertEqual(expected, 1)
    }
    
    func test_totalCoutn_return3(){
        selectedPassangerViewModel.toIncreasePassengerCount(passenger: .adult)
        selectedPassangerViewModel.toIncreasePassengerCount(passenger: .kind)
        let expected = selectedPassangerViewModel.totalCount
        XCTAssertEqual(expected, 3)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

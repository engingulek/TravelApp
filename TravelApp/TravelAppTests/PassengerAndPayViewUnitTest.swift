//
//  PassengerAndPayViewUnitTest.swift
//  TravelAppTests
//
//  Created by engin gülek on 16.06.2023.
//

import XCTest
@testable import TravelApp
final class PassengerAndPayInfoViewModelTest: XCTestCase {

    var viewModel : PassengerAndPayInfoViewModel!
    override func setUp(){
        super.setUp()
        viewModel = PassengerAndPayInfoViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_mobilPhoneError_PhoneNumberEmptyError()  {
      
      
        viewModel.mobilePhone = ""
        XCTAssertThrowsError(try viewModel.phoneNumberEmptyError()) { error in
            XCTAssertEqual(error as! PhoneNumberError, PhoneNumberError.EmptyPhoneNumberNullError)
            
        }
    }
    
    func test_mobilPhoneError_MissingNumberError()  {
        viewModel.mobilePhone = "532 3"
        XCTAssertThrowsError(try viewModel.phoneNumberMissing()) { error in
            XCTAssertEqual(error as! PhoneNumberError, PhoneNumberError.MissingNumberError)
        }
    }
    
    func test_mobilPhoneError_WhenselectedTurkey_FirstNumberIsFive() {
        viewModel.selectedCountryPhoneCode = CountryPhoneCode(name: "Türkiye", dial_code: "+90", code: "TR", defaultType: "XXX XXX XX XX")
        viewModel.mobilePhone = "444 44 44"
        XCTAssertThrowsError(try viewModel.firstNumberFive()) { error in
            XCTAssertEqual(error as! PhoneNumberError, PhoneNumberError.FirstNumberIsFive)
        }
    }
    
    func test_emailError_EmptyEmail() {
        viewModel.email = ""
        XCTAssertThrowsError(try viewModel.emptyEmailError()){ error in
            XCTAssertEqual(error as! EmailError, EmailError.EmptyEmail)
            
        }
    }
    
    func test_formaterEmail_EmailFormaterError() {
        viewModel.email = "test@testcom"
        XCTAssertThrowsError(try viewModel.formaterEmailError()){ error in
            XCTAssertEqual(error as! EmailError, EmailError.EmailFormaterError)
            
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

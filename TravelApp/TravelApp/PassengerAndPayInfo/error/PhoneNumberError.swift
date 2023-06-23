//
//  Extension+PassengerAndPayInfoViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 16.06.2023.
//

import Foundation

enum PhoneNumberError : LocalizedError {
    case EmptyPhoneNumberNullError
    case MissingNumberError
    case FirstNumberIsFive
    
    var errorDescription: String? {
        switch self {
            
        case .EmptyPhoneNumberNullError:
            return "This field is required"
        case .MissingNumberError:
            return "Enter the full number"
        case .FirstNumberIsFive:
            return "First Number must be five"
            
        
        }
    }
}

extension PassengerAndPayInfoViewModel {
    func phoneNumberEmptyError() throws {
        // Leaving the phone number field blank
        guard  mobilePhone.count != 0  || mobilePhone.count == selectedCountryPhoneCode.defaultType.count  else { throw PhoneNumberError.EmptyPhoneNumberNullError}
    }
    // Not filling in the phone number part completely
    func phoneNumberMissing() throws {
        guard  mobilePhone.count == selectedCountryPhoneCode.defaultType.count else {throw PhoneNumberError.MissingNumberError}
    }
    // The first character of the Turkey phone number is not 5
 func firstNumberFive() throws {
        if selectedCountryPhoneCode.code == "TR" {
            guard mobilePhone.first == "5" else { throw PhoneNumberError.FirstNumberIsFive}
        }
    }
    
    
    internal func controlPhoneNumber(){
          // MARK: - Phone Number Error
          do {
              try phoneNumberEmptyError()
              try phoneNumberMissing()
              try firstNumberFive()
              self.phoneNumberEmmtyError = false
              
          }catch{
              self.phoneNumberEmmtyError = true
              self.phoneNumberErrorMessage = error.localizedDescription
          }
      }
}

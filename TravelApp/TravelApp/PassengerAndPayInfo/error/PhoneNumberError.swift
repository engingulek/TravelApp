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
  private  func phoneNumberEmptyError() throws {
        
        guard  mobilePhone.count != 0  || mobilePhone.count == selectedCountryPhoneCode.defaultType.count  else { throw PhoneNumberError.EmptyPhoneNumberNullError}
    }
    
  private  func phoneNumberMissing() throws {
        guard  mobilePhone.count == selectedCountryPhoneCode.defaultType.count else {throw PhoneNumberError.MissingNumberError}
    }
    
   private func firstNumberFive() throws {
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

//
//  PassengerInfoError.swift
//  TravelApp
//
//  Created by engin gülek on 16.06.2023.
//

import Foundation

enum PassengerInfoError : LocalizedError {
    case NameEmptyError
    case SurnameEmptyError
    case DateOfBirtEmptyError
    case TCidNoEmptyError
    case DateOfBirthCountControl
    case DateOfBirthDayControl
    case DateOfBirthMonthControl
    case DateOfBirthYearControl
    case DateBirthDateControl
    case TcCitizienCountCountrol
    case TcCitizenFormatControl
    
    
    var errorDescription: String?{
        switch self {
        case .NameEmptyError,.SurnameEmptyError,.DateOfBirtEmptyError,.TCidNoEmptyError:
            return "This field is required"
        case .DateOfBirthCountControl:
            return "Enter full date of birth"
        case .DateOfBirthDayControl:
            return "Should be between day 1-31"
        case .DateOfBirthMonthControl:
            return "Should be between month 1-12"
        case .DateOfBirthYearControl:
            return "Should be between year 1930 - 2023"
        
        case .DateBirthDateControl:
            return "Check date of birth"
            
        case .TcCitizienCountCountrol:
            return "Should be 11 characters"
        case .TcCitizenFormatControl:
            return "Tc Citizien format error"
            
    
        }
        
        
    }
}

extension PassengerAndPayInfoViewModel {
    
    func emptyError() throws{
        guard name.count != 0 else {throw PassengerInfoError.NameEmptyError}
        guard surname.count != 0 else {throw PassengerInfoError.SurnameEmptyError}
        guard dateOfBirth.count != 0 else {throw PassengerInfoError.DateOfBirtEmptyError}
        guard idNo.count != 0 else {throw PassengerInfoError.TCidNoEmptyError}
    }
    
    func dateOfBirhtControl() throws {
        guard dateOfBirth.count == 10 else { throw PassengerInfoError.DateOfBirthCountControl}
        
        guard 1 <= Int(dateOfBirth[0..<2])! && Int(dateOfBirth[0..<2])! <= 31 else {
            throw PassengerInfoError.DateOfBirthDayControl
        }
        guard 1 <= Int(dateOfBirth[3..<5])! && Int(dateOfBirth[3..<5])! <= 12 else {
            throw PassengerInfoError.DateOfBirthMonthControl
        }
        guard 1930 <= Int(dateOfBirth[6..<10])! && Int(dateOfBirth[6..<10])! <= 2023 else{
            throw PassengerInfoError.DateOfBirthYearControl
        }
        
        guard dateOfBirth.stringToDatePartTwo(format: "dd/MM/yyyy") <= Date.now.dateToString().stringToDatePartTwo(format: "dd/MM/yyyy") else {
            throw PassengerInfoError.DateBirthDateControl
        }
    }
    
  
    
    private func tcCitizienIDControl() throws {
        guard idNo.count == 11 else { throw PassengerInfoError.TcCitizienCountCountrol}
        guard validateCitizenshipID(ID: Int(idNo)!) == true else {throw PassengerInfoError.TcCitizenFormatControl}
    }
    
    internal func controlPassengerInfo() {
        do{
            try emptyError()
            try dateOfBirhtControl()
            try tcCitizienIDControl()
            self.passengerInfoError = false
           
        }catch{
            self.passengerInfoError = true
            self.passengerInfoErrorMessage = error.localizedDescription
        }
        
    }
    
}



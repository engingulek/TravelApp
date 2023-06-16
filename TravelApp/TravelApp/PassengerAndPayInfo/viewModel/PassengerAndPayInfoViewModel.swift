//
//  PassengerAndPayInfoViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation

final class PassengerAndPayInfoViewModel : ObservableObject {
    var jsonServiceManager = JsonServiceManager()
    @Published var countryPhoneCodeList = [CountryPhoneCode]()
    @Published var selectedCountryPhoneCode : CountryPhoneCode = CountryPhoneCode(name: "Türkiye", dial_code: "+90", code: "TR", defaultType: "XXX XXX XX XX")
    @Published var mobilePhone = ""
    @Published  var email = ""
    
    @Published var phoneNumberEmmtyError  : Bool = false
    @Published var phoneNumberErrorMessage: String = ""
    
    @Published var errorEmail : Bool = false
    @Published var emailErrorMessage : String = ""
    
    @Published  var name = ""
    @Published  var surname = ""
    @Published  var dateOfBirth = ""
    @Published  var idNo = ""
    @Published  var passportNo = ""
    @Published  var nationality = ""
    @Published var passengerInfoError : Bool = false
    @Published var passengerInfoErrorMessage = ""
    
    func getCountryJsonData(){
        jsonServiceManager.fetchLocalJsonData(target: .countryPhonecode) { (response:Result<[CountryPhoneCode]?,Error>) in
            switch response {
            case .success(let list):
                self.countryPhoneCodeList = list!
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func phoneNumberFormatter(format:String,phoneNumber:String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result:String = ""
        var index = number.startIndex
        
        for character in format where index < number.endIndex {
            if character == "X"{
                result.append(number[index])
                index = number.index(after: index)
            }else{
                result.append(character)
            }
        }
        return result
    }
    
    func dateOfBirthFormater(birth:String) -> String {
        let birth = birth.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result:String = ""
        var index = birth.startIndex
        let formnat = "XX/XX/XXXX"
        
        for character in formnat where index < birth.endIndex {
            if character == "X" {
                result.append(birth[index])
                index = birth.index(after: index)
            }else{
                result.append(character)
            }
        }
        return result
    }
    
    func validateCitizenshipID(ID: Int) -> Bool {
        let digits = ID.description.compactMap({ $0.wholeNumberValue })
        
        if digits.count == 11 && digits.first != 0 {
            let first   = (digits[0] + digits[2] + digits[4] + digits[6] + digits[8]) * 7
            let second  = (digits[1] + digits[3] + digits[5] + digits[7])
            
            let digit10 = (first - second) % 10
            let digit11 = (digits[0] + digits[1] + digits[2] + digits[3] + digits[4] + digits[5] + digits[6] + digits[7] + digits[8] + digits[9]) % 10
            
            if (digits[10] == digit11) && (digits[9] == digit10) {
                return true
            }
        }
        return false
    }
    
    func payButtonAction(){
        controlPhoneNumber()
        controlEmail()
        controlPassengerInfo()
    }
}




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
    
    @Published var cardInfoError : Bool = false
    @Published var cardInfoErrorMessage = ""
    
    
    @Published  var cardNo = ""
    @Published  var expirationDate = ""
    @Published  var cvc2 = ""
    
    
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
    func payButtonAction(){
       /* controlPhoneNumber()
        controlEmail()
        controlPassengerInfo()*/
        controlCardInfo()
    }
    
    func infoFormatter(info:String,format:String) -> String{
        let value = info.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result : String = ""
        var index = value.startIndex
        
        for character in format where index < value.endIndex{
            if character == "X"{
                result.append(value[index])
                index = value.index(after: index)
            }else{
                result.append(character)
            }
        }
        return result
    }
    
    func cvc2Format(info:String) -> String {
        let value = info.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result : String = ""
        var index = value.startIndex
        let format = "N**"
        
        for char in format where index < value.endIndex {
            if char == "N" {
                result.append(value[index])
                index = value.index(after: index)
            }else{
                result.append(char)
                index = value.index(after: index)
            }
        }
        return result
    }

    
    // MARK: - Validation TC Citizien ID
    
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
    
}


extension PassengerAndPayInfoViewModel {
    
 
    
    
    // MARK: - Phone Number Formantter
    /*func phoneNumberFormatter(format:String,phoneNumber:String) -> String {
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
    
    // MARK: - Date Of Birth Formatter
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
    
  
    
    // MARK: - Cart Number Formatter
    func cartNumberFormatter(cartNumber:String) -> String {
        let cartNumber = cartNumber.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result:String = ""
        var index = cartNumber.startIndex
        let format = "XXXX XXXX XXXX XXXX"
        for character in format where index < cartNumber.endIndex{
            if character == "X"{
                result.append(cartNumber[index])
            }else{
                result.append(character)
            }
                
        }
        return result
    }*/
}




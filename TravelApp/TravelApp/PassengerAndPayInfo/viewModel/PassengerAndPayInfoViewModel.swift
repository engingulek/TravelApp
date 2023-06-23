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
    @Published var passengerInfoList = [PassengerInfo]()
    
    
    
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
       controlPhoneNumber()
        controlEmail()
        controlPassengerInfo()
        controlCardInfo()
    }
    
    func passengerInfoListWrite(index:Int){
        name = ""
        surname = ""
        dateOfBirth = ""
        idNo = ""
        if passengerInfoList.count > index {
            name = passengerInfoList[index].name
            surname = passengerInfoList[index].surname
            dateOfBirth = passengerInfoList[index].dateOfBirth
            idNo = passengerInfoList[index].tcidNo
       
        }
        
    }
    
    // MARK: - Info Formatter
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





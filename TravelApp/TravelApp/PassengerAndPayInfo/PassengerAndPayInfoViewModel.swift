//
//  PassengerAndPayInfoViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation

class PassengerAndPayInfoViewModel : ObservableObject {
    var jsonServiceManager = JsonServiceManager()
    @Published var countryPhoneCodeList = [CountryPhoneCode]()
    @Published var selectedCountryPhoneCode : CountryPhoneCode = CountryPhoneCode(name: "Türkiye", dial_code: "+90", code: "TR", defaultType: "XXX XXX XX XX")
    @Published var mobilePhone = ""
    @Published  var email = ""
    @Published var formanterErrorEmail : Bool = false
    @Published var phoneNumberEmmtyError  : Bool = false
    @Published var phoneNumberErrorMessage: String = ""
    
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
    
    func payButtonAction(){
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




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
    @Published var selectedCountryPhoneCode : CountryPhoneCode?
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
}

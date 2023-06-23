//
//  CartInfoError.swift
//  TravelApp
//
//  Created by engin gülek on 17.06.2023.
//

import Foundation

enum CardInfoError : LocalizedError {
    case CardExpirationDateControl
    case CardInfoEmptyError
    
    var errorDescription: String? {
        switch self {
        case .CardExpirationDateControl:
            return "Card has expired"
        case .CardInfoEmptyError:
            return "Empty full"
        }
    }
}


extension PassengerAndPayInfoViewModel {
    func passengerCardControl() throws {
       
       guard expirationDate.count == 5 else {throw CardInfoError.CardInfoEmptyError}
       guard cvc2.count == 3 else {throw CardInfoError.CardInfoEmptyError}
       guard cardNo.count == 19 else {throw CardInfoError.CardInfoEmptyError}
        guard expirationDate.stringToDatePartTwo(format: "MM/yy") > Date.now.dateToString().stringToDatePartTwo(format: "MM/yy") else {
            throw CardInfoError.CardExpirationDateControl
        }
       
      
    }
    
    internal func controlCardInfo(){
        do{
            try passengerCardControl()
            self.cardInfoError = false
        }catch{
            self.cardInfoError = true
            self.cardInfoErrorMessage = error.localizedDescription
        }
    }
}

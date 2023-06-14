//
//  FlightInfoViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation
class FlightInfoViewModel : ObservableObject {

    func returnPricePassenger(count:Int,passenger:String,priceList:[PriceInfo]) -> String{
        let passengerList = priceList.filter { $0.person.lowercased() == passenger.lowercased() }
        let price = Double(passengerList[0].price) * Double(count)   
        return String(format: "%.1f", price)
    }
    
    func returnPersonCount(passenger:[String:Int]) -> Int{
        var totalCount = 0
        for count in passenger.values {
            totalCount += count
            
        }
        return totalCount
    }
    
   
}

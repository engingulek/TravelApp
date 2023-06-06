//
//  SelectDepAndArDateViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 6.06.2023.
//

import Foundation
import SwiftUI
class SelectDepAndArDateViewModel : ObservableObject {
    @Published var selectedDepatureDate = Date.now
    @Published var selectedArrivelDate = Date.now
    
    @Published var deptureDateRange : ClosedRange<Date> = {
        let calender = Calendar.current
        let minDate = calender.date(byAdding: .day, value: 0, to: .now)
        let maxDate = calender.date(byAdding: .month, value: 11, to: .now)
        return minDate!...maxDate!
    }()
    
   

}

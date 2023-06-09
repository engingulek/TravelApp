//
//  Extension+View.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import Foundation
import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

extension Date  {
    func dateFormatted() -> String {
        return self.formatted(.dateTime.day().month().year()) as String
    }
    
    func dayMonthFormat()-> (String,String) {
        let day = self.formatted(.dateTime.day())
        let month = self.formatted(.dateTime.month())
        return (day,month)
    }
    
    
}

extension String {
  
    func stringToDate() -> Date {
        let dateFormatter = DateFormatter()
        let getDate = self
        let a = getDate.split(separator: " ")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: "\( a[0])")
        return date ?? Date.now
        
    }
    
}


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
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
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
    
    func stringToDatePartTwo() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let getDate = self
        let a = getDate.split(separator: " ")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: "\( a[0])")
        return date ?? Date.now

    }
    
    func splitTime() -> String {
        let timeSplit = self.split(separator: ":")
        return String(timeSplit[0])
    }
    
    func time24Clockchange00() -> String {
        self == "00" ? "24" : self
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

extension Dictionary {
    func dictionaryToArray() -> [String] {
        let dic:[String:Int] = self as! [String:Int]
        var passengerListArray = [String]()
        for a in dic{
            for _ in 0..<dic[a.key]!{
                passengerListArray.append(a.key)
            }
        }
        return passengerListArray
    }
}


extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}




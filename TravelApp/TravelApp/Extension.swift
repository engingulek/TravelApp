//
//  Extension+View.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


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
    
    
    func add30MinuteClock() -> Date{
        let clock = self
        let calender  = Calendar.current
        let returnClock = calender.date(byAdding: .minute,value: 20,to: clock)
        return returnClock ?? Date.now
    }
    
    
}

extension String {
/// to be reviewed
    func stringToDate() -> Date {
        let dateFormatter = DateFormatter()
        let getDate = self
        let a = getDate.split(separator: " ")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: "\( a[0])")
        return date ?? Date.now

    }
    
    func stringToDatePartTwo(format : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let getDate = self
        let a = getDate.split(separator: " ")
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: "\( a[0])")
        return date ?? Date.now
    }
    
    func stringToClock() -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        dateFormatter.dateFormat = "HH:mm"
        let getClock = self
        let clock = dateFormatter.date(from: getClock)
        return clock ?? Date.now
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




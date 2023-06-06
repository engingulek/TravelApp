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
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}


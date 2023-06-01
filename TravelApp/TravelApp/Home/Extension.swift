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

extension HomeView {
// MARK: - Title Design
     var title : some View {
                 Text("TravelApp")
                     .font(.title)
                     .fontWeight(.bold)
                     .foregroundColor(.white)
             .padding(.vertical,10)
    }

}


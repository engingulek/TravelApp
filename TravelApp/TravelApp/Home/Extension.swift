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
     var title : some View {
        VStack(spacing:10) {
            Text("TravelApp")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("We are with you on every journey")
                .font(.callout)
                .fontWeight(.bold)
        }.foregroundColor(.white)
            .padding(.vertical)
    }
}

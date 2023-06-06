//
//  Extension+HomeView.swift
//  TravelApp
//
//  Created by engin gülek on 6.06.2023.
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

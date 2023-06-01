//
//  TabBarView.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import SwiftUI
import SlidingTabView
struct HomeView: View {
    @State private var tabIndex = 0
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack {
               title
                VStack(alignment: .center) {
                          SlidingTabView(selection: self.$tabIndex,
                                         tabs: ["Flight", "Other"])
                    if tabIndex == 0 {
                        FlightView()
                    }else{
                        Text("Other")
                    }
                    Spacer()
                }.background(Color("backgroundTabbar"))
                    
                    .roundedCorner(30, corners: [.topLeft, .topRight])
                    .ignoresSafeArea()
                   
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




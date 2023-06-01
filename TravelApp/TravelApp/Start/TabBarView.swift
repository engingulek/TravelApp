//
//  TabBarView.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import SwiftUI
import SlidingTabView
struct TabBarView: View {
    @State private var tabIndex = 0
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack {
               title
                VStack(alignment: .leading) {
                          SlidingTabView(selection: self.$tabIndex,
                                         tabs: ["Home", "Other"])
                    if tabIndex == 0 {
                        
                    }else{
                        Text("Other")
                    }
                    Spacer()
                      }.background(Color.white)
                    
                    .roundedCorner(30, corners: [.topLeft, .topRight])
                    .ignoresSafeArea()
                   
            }

        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}




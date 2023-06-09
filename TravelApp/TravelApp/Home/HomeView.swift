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
        ZStack {
          
            VStack {
                Color.blue
              .frame(height: UIScreen.main.bounds.height / 3)
              .roundedCorner(30, corners: [.bottomLeft,.bottomRight])
              .ignoresSafeArea()
                Spacer()
            }
            VStack {
                title
                VStack(alignment: .center) {
                          SlidingTabView(selection: self.$tabIndex,
                                         tabs: ["Flight", "Bus"])
                          .background(Color.white)
                          .cornerRadius(20)
                          .padding(.horizontal,5)
                    
                    if tabIndex == 0 {
                        VStack {
                         FlightView()
                            
                        }.background(Color.white)
                            .cornerRadius(15)
                            .padding()
                    }else {
                        
                    }
                    Spacer()
                }.ignoresSafeArea()
            }
        }.background(Color("backgroundTabbar"))

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FlightViewModel())
                .environmentObject(SelectDepAndArDateViewModel())
                .environmentObject(SelectPassengerViewModel())
                .environmentObject(ClassViewModel())
                .environmentObject(FlightTicketSearchViewModel())
            
    }
}


//
//  ClassView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
   
 
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("Class Type")) {
                    ForEach(ClassType.allCases){ classType in
                        ClassRow(classType: classType)
                    }
                   }
                   .headerProminence(.increased)
                
                
                Section(header: Text("Times Of Day")) {
                    ForEach(TimesOfDay.allCases){ timesOfDay in
                        TimesOfDayRow(timesOfDay: timesOfDay)
                    }
                   }
                   .headerProminence(.increased)
                
            
            }.navigationTitle("Filter")
                .navigationBarTitleDisplayMode(.inline)
            
            Button("Filter") {
                filterViewModel.filterFlightList()
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .environmentObject(FilterViewModel())
            .environmentObject(FlightViewModel())
    }
}

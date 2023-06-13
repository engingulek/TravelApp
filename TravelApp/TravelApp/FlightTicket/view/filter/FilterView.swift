//
//  ClassView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI



struct FilterView: View {
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    @Environment(\.dismiss) var dismiss
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
                    ForEach(TimesOfDay.allCases,id:\.self){ timesOfDay in
                        TimesOfDayRow(timesOfDay: timesOfDay)
                    }
                   }
                   .headerProminence(.increased)
                
            
            }.navigationTitle("Filter")
                .navigationBarTitleDisplayMode(.inline)
            
            HStack {
                Button("Filter") {
                    self.flightTicketSearchViewModel.filterFlightList()
                    self.dismiss()
                }
                .padding(.horizontal,10)
                .padding(.vertical,5)
                .background(
                    self.flightTicketSearchViewModel.selectedClassType != nil ||
                    self.flightTicketSearchViewModel.selectedTimesOfDay != nil ?
                    
                    Color.blue : Color.blue.opacity(0.4))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .disabled(
                    self.flightTicketSearchViewModel.selectedClassType != nil ||
                    self.flightTicketSearchViewModel.selectedTimesOfDay != nil ? false : true
                )
              
                
                Button("Cancel") {
                    self.dismiss()
                    self.flightTicketSearchViewModel.selectedClassType = nil
                    self.flightTicketSearchViewModel.selectedTimesOfDay = nil
                }
                .padding(.horizontal,10)
                .padding(.vertical,5)
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
          
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .environmentObject(FlightTicketSearchViewModel())
    }
}

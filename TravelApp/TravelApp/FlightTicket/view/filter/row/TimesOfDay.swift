//
//  TimesOfDay.swift
//  TravelApp
//
//  Created by engin gülek on 13.06.2023.
//

import SwiftUI

struct TimesOfDayRow: View {
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    let timesOfDay:TimesOfDay
    var body: some View {
        HStack {
            Text(timesOfDay.rawValue )
            Spacer()
            if timesOfDay == flightTicketSearchViewModel.selectedTimesOfDay {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
                    
            }
           
           
        }.contentShape(Rectangle())
            .onTapGesture {
                flightTicketSearchViewModel.selectedTimesOfDay = timesOfDay
                       }
           
    }
}

struct TimesOfDayRow_Previews: PreviewProvider {
    static var previews: some View {
        TimesOfDayRow(timesOfDay: .afternoon)
            .environmentObject(FlightTicketSearchViewModel())
    }
}

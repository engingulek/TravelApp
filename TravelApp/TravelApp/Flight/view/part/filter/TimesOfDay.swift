//
//  TimesOfDay.swift
//  TravelApp
//
//  Created by engin gülek on 13.06.2023.
//

import SwiftUI

struct TimesOfDayRow: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    let timesOfDay:TimesOfDay
    var body: some View {
        HStack {
            Text(timesOfDay.rawValue )
            Spacer()
            if timesOfDay == filterViewModel.selectedTimesOfDay {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
                    
            }
           
           
        }.contentShape(Rectangle())
            .onTapGesture {
                filterViewModel.selectedTimesOfDay = timesOfDay
                       }
           
    }
}

struct TimesOfDayRow_Previews: PreviewProvider {
    static var previews: some View {
        TimesOfDayRow(timesOfDay: .afternoon)
            .environmentObject(FilterViewModel())
    }
}

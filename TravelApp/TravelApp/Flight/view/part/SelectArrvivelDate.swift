//
//  SelectArrvivelDate.swift
//  TravelApp
//
//  Created by engin gülek on 6.06.2023.
//

import SwiftUI

struct SelectArrvivelDate: View {
    @EnvironmentObject var selectedDepAndArViewModel : SelectDepAndArDateViewModel
    var startArrivelDate : Date
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        @State var arrivelDateRange : ClosedRange<Date> = {
             let calender = Calendar.current
            let minDate = calender.date(byAdding: .day, value: 0, to: startArrivelDate)
             let maxDate = calender.date(byAdding: .month, value: 11, to: .now)
             return minDate!...maxDate!
         }()
            VStack {
                Text("Select Arrivel Date")
                    .fontWeight(.bold)
                DatePicker("Select Depature Date",
                           selection: $selectedDepAndArViewModel.selectedArrivelDate, in: arrivelDateRange,displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .onChange(of: selectedDepAndArViewModel.selectedArrivelDate) { newValue in
                    self.dismiss()
                }
            }
    }
}

struct SelectArrvivelDate_Previews: PreviewProvider {
    static var previews: some View {
        SelectArrvivelDate(startArrivelDate: .now)
    }
}

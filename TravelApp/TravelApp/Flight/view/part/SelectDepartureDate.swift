//
//  SelectDepartureDate.swift
//  TravelApp
//
//  Created by engin gülek on 6.06.2023.
//

import SwiftUI

struct SelectDepartureDate: View {
    @EnvironmentObject var selectedDepAndArViewModel : SelectDepAndArDateViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
            VStack {
                Text("Select Depature Date")
                    .fontWeight(.bold)
                DatePicker("Select Depature Date",
                           selection: $selectedDepAndArViewModel.selectedDepatureDate, in: selectedDepAndArViewModel.deptureDateRange,displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .onChange(of: selectedDepAndArViewModel.selectedDepatureDate) { newValue in
                    if newValue > selectedDepAndArViewModel.selectedArrivelDate {
                        selectedDepAndArViewModel.selectedArrivelDate = newValue
                    }

                    self.dismiss()
                }
            }
    }
}

struct SelectDepartureDate_Previews: PreviewProvider {
    static var previews: some View {
        SelectDepartureDate()
    }
}

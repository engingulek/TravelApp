//
//  ClassSelectionRow.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct ClassRow: View {
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    let classType:ClassType
    var body: some View {
        HStack {
            Text(classType.rawValue )
            Spacer()
            if classType == flightTicketSearchViewModel.selectedClassType {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
                    
            }
           
           
        }.contentShape(Rectangle())
            .onTapGesture {
                flightTicketSearchViewModel.selectedClassType = classType
                       }
           
    }
}

struct ClassSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        ClassRow(classType: .economy)
            .environmentObject(FlightTicketSearchViewModel())
    }
}

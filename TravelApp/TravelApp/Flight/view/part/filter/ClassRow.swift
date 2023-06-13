//
//  ClassSelectionRow.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct ClassRow: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    let classType:ClassType
    var body: some View {
        HStack {
            Text(classType.rawValue )
            Spacer()
            if classType == filterViewModel.selectedClassType {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
                    
            }
           
           
        }.contentShape(Rectangle())
            .onTapGesture {
                filterViewModel.selectedClassType = classType
                       }
           
    }
}

struct ClassSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        ClassRow(classType: .economy)
            .environmentObject(FilterViewModel())
    }
}

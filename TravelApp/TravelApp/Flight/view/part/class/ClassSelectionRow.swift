//
//  ClassSelectionRow.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct ClassSelectionRow: View {
    @EnvironmentObject var classViewModel : ClassViewModel
    let title:String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            title == classViewModel.selectedClassType ?
            Image(systemName: "checkmark")
                .foregroundColor(.accentColor)
            : nil
        }.contentShape(Rectangle())
            .onTapGesture {
                classViewModel.selectedClassType = self.title
            }
    }
}

struct ClassSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        ClassSelectionRow(title: "Economy")
            .environmentObject(ClassViewModel())
    }
}

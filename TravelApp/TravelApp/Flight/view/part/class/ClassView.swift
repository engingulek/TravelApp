//
//  ClassView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct ClassView: View {
    @EnvironmentObject var classViewModel : ClassViewModel
    @State var testSelect:String?
    var body: some View {
        NavigationStack {
            List{
                ForEach(ClassType.allCases){ classType in
                    ClassSelectionRow(title: classType.rawValue)
                }
            }.navigationTitle("Class Type")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
            .environmentObject(ClassViewModel())
    }
}

//
//  ClassViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation


enum ClassType : String,CaseIterable,Identifiable{
    var id : String { UUID().uuidString }
    
    case economy = "Economy"
    case business = "Business"
}

class ClassViewModel : ObservableObject {
    @Published var selectedClassType = ClassType.economy.rawValue
}

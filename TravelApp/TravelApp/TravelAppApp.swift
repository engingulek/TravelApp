//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import SwiftUI

@main
struct TravelAppApp: App {
    @StateObject var flightViewModel = FlightViewModel()
    @StateObject var selectedDepAndArViewModel = SelectDepAndArDateViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(flightViewModel)
                .environmentObject(selectedDepAndArViewModel)
        }
    }
}

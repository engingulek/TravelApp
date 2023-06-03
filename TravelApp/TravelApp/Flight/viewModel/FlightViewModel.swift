//
//  FlightViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 3.06.2023.
//

import Foundation

final class FlightViewModel : ObservableObject {
    @Published var text = ""
    @Published var resutlFlight : [Flight] = []
    @Published var cityAndCountryFilterList : [Flight] = []
    @Published var airportFilterList : [Flight] = []


    init(){
        getData()
    }
    
    func getData(){
        let airport0 = Airport(id: 0,
                              name: "Sabiha",
                              code: "SAW")
        let airport1 = Airport(id: 1,
                              name: "İstanbul Havalimanı",
                              code: "IST")
        let airport2 = Airport(id: 2,
                              name: "Esenboğa",
                              code: "ESB")
        
        let flight = Flight(id: 0,
                            city: City(id: 0,
                                       name: "İstanbul",
                                       code: "ISTA",
                                       airport: [airport0,airport1]),
                            country: "Türkiye")

        let flight1 = Flight(id: 1,
                            city: City(id: 1,
                                       name: "Ankara",
                                       code: "ANK",
                                       airport: [airport2]),
                            country: "Türkiye")

        resutlFlight.append(flight)
        resutlFlight.append(flight1)
    }
    
    func searchFlight() {
        cityAndCountryFilterList = []
        airportFilterList = []
        cityAndCountryFilterList =   resutlFlight.filter {
            $0.country.lowercased().contains(text.lowercased()) ||
            $0.city.name.lowercased().contains(text.lowercased())
        }
        
        for filter in resutlFlight {
            for airport in filter.city.airport{
                if airport.name.lowercased().contains(text.lowercased()){
                    airportFilterList.append(
                        .init(id: filter.id,
                              city: City(id: filter.city.id,
                                         name: filter.city.name,
                                         code: filter.city.code,
                                         airport: [airport]),
                              country: filter.country)
                    )
                }
            }
        }

            
    }
}

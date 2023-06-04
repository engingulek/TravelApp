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
    @Published var populerCitiesDomestic : [Flight] = []
    @Published var populerCitiesAbroad : [Flight] = []
    @Published var selectedDepature : City?
    @Published var selectedArrivel : City?
    @Published var textSelectedDepature  = "City/Airport"
    @Published var textSelectedArrivel  = "City/Airport"
    


    init(){
        getDataAirport()
        getPopulerCities()
    }
    
    func getDataAirport(){
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
    
    func getPopulerCities()  {
        let airport0 = Airport(id: 0,
                              name: "Sabiha",
                              code: "SAW")
        let airport1 = Airport(id: 1,
                              name: "İstanbul Havalimanı",
                              code: "IST")
        
        let airport2 = Airport(id: 2,
                              name: "Selanik Uluslararası Havalimanı",
                              code: "SKG")
        
        
        //
        let flight = Flight(id: 0,
                            city: City(id: 0,
                                       name: "İstanbul",
                                       code: "ISTA",
                                       airport: [airport0,airport1]),
                            country: "Türkiye")
        
        let flight1 = Flight(id: 1,
                            city: City(id: 1,
                                       name: "Selanik",
                                       code: "ISTA",
                                       airport: [airport2]),
                            country: "Yunanistan")
        populerCitiesDomestic.append(flight)
        populerCitiesAbroad.append(flight1)
        populerCitiesDomestic.append(flight)
        populerCitiesAbroad.append(flight1)
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
    
    func selectedLocation(selectCityforSearch selectCity:City,
                          selectAirportForSearch selectAirport:[Airport],
                          selectType:Bool){
        
        var city = selectCity
        city.airport = selectAirport
        if selectType {
            selectedDepature = city
            guard let depature = selectedDepature  else {return}
            let cityName = depature.name
            let airportName = depature.airport.count  >= 2 ? "All Airports" : depature.airport[0].name
            textSelectedDepature = "\( cityName)/\(airportName)"
        }else{
            selectedArrivel = city
            guard let arrivel = selectedArrivel else {return}
            let cityName = arrivel.name
            let airportName = arrivel.airport.count >= 2 ? "All Airports" : arrivel.airport[0].name
            textSelectedArrivel = "\( cityName)/\( airportName)"
            
        }
    }
    
    func changeFromAndTo(){
        var selectedTemp = selectedArrivel
        selectedArrivel = selectedDepature
        selectedDepature = selectedTemp
        
        
        var selectedText = textSelectedArrivel
        textSelectedArrivel = textSelectedDepature
        textSelectedDepature = selectedText
    }
    
   
    
    
    
    
}

//
//  FlightViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 3.06.2023.
//

import Foundation

final class FlightViewModel : ObservableObject {
    @Published var text = ""
    @Published var resutlFlight : [FlightVM] = []
    @Published var cityAndCountryFilterList : [FlightVM] = []
    @Published var airportFilterList : [FlightVM] = []
    
    @Published var populerCitiesDomestic : [Flight] = []
    @Published var populerCitiesAbroad : [Flight] = []
    @Published var selectedDepature : City?
    @Published var selectedArrivel : City?
    @Published var textSelectedDepature  = "City/Airport"
    @Published var textSelectedArrivel  = "City/Airport"
    private var flightService = FlightService()
    


    
    func getDataAirport() async {
        
        do {
            await flightService.getFlights(completion: { (response:Result<[Flight],Error>) in
                switch response {
                case .success(let list):
                    DispatchQueue.main.async {
                        self.resutlFlight = list.map(FlightVM.init)
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.resutlFlight = []
                    }
                }
            })
        }
    }
    
    func getPopulerCities()  {
       
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
                        .init(flight: Flight(_id: filter.id,
                                           city: City(id: filter.city.id,
                                            name: filter.city.name,
                                            code: filter.city.code,
                                                      airport: [airport]), country: filter.country))
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
        let selectedTemp = selectedArrivel
        selectedArrivel = selectedDepature
        selectedDepature = selectedTemp
        
        
        let selectedText = textSelectedArrivel
        textSelectedArrivel = textSelectedDepature
        textSelectedDepature = selectedText
    }
}


struct FlightVM : Identifiable {
    let flight : Flight
    var id : String{
        flight._id
    }
    var city : City {
        flight.city
    }
    var country : String {
        flight.country
    }
}

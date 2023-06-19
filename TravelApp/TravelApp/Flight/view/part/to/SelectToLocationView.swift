//
//  SelectToLocationView.swift
//  TravelApp
//
//  Created by engin gülek on 9.06.2023.
//

import SwiftUI

struct SelectToLocationView: View {
    @EnvironmentObject  var flightViewModel : FlightViewModel
    @Environment(\.dismiss) var dismiss
    @State var selectType = true
    var body: some View {
        VStack (alignment:.leading){
            VStack(spacing : 10) {
                Text("Select Departure Airport")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Text("From")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title2)
                        .onTapGesture {
                            dismiss()
                            flightViewModel.text = ""
                        }
                }.padding(.horizontal)
                
                TextField("Enter City and Airport", text: $flightViewModel.text)
                    .onChange(of: flightViewModel.text) { _ in
                        flightViewModel.searchFlight()
                    }
                    .font(.callout)
                    .padding(.all,10)
                    .background(Color.white)
                    .foregroundColor(Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            .background(Color.blue)
            // MARK: - Search starts when text count is 3
            if flightViewModel.text.count >= 3 {
                VStack(spacing:10){
                    
                    if !flightViewModel.cityAndCountryFilterList.isEmpty {
                        ForEach(flightViewModel.cityAndCountryFilterList) { result in
                            /// If the number of airports in the city is more than 2, all airports are written
                            
                            if result.city.airport.count >= 2{
                                VStack {
                                    HStack {
                                        VStack(alignment:.leading) {
                                            Text("\(result.city.name),\(result.country)")
                                            
                                            Text("All Airports")
                                                .font(.footnote)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                            
                                        }
                                        Spacer()
                                        Text(result.city.code)
                                            .font(.footnote)
                                            .padding(.all,5)
                                            .background(Color.gray.opacity(0.6))
                                            .cornerRadius(10)
                                        
                                    }.padding(.trailing)
                                    Divider()
                                        .padding(.trailing)
                                } .onTapGesture {
                                    print(result.city.name)
                                    print(result.country)
                                    print("All airports")
                                    print(result.city.code)
                                    flightViewModel.selectedArrivel = City(id: result.city.id,
                                                                           name: result.city.name,
                                                                           code: result.city.code,
                                                                           airport: result.city.airport)
                                    flightViewModel.textSelectedArrivel = "\(result.city.name)/All Airports"
                                    flightViewModel.text = ""
                                    self.dismiss()
                                }
                                // MARK: - Airports List
                                airportList(result: result)
                                
                            }
                            else{
                                airportList(result: result)
                                
                            }
                            
                        }
                    }else{
                        if !flightViewModel.airportFilterList.isEmpty {
                            ForEach(flightViewModel.airportFilterList) { result in
                                airportList(result: result)
                            }
                        }else{
                            Text("There were no results")
                        }
                        
                    }
                    Spacer()
                }.padding(.leading)
            }else{
                resultNil
            }
        }.task {
             await flightViewModel.getDataAirport()
            await flightViewModel.getPopulerCities()
        }
    }
}







struct SelectToLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectToLocationView()
            .environmentObject(FlightViewModel())
    }
}




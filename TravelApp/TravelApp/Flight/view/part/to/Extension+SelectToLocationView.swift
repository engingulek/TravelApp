//
//  Extension+SelectToLocationView.swift
//  TravelApp
//
//  Created by engin gülek on 9.06.2023.
//

import Foundation
import SwiftUI

extension SelectToLocationView {
    var resultNil : some View {
        VStack(alignment:.leading,spacing: 10) {
            Text("Populer Cities")
                .fontWeight(.bold)
         
            
            VStack(alignment:.leading) {
                HStack{
                    ForEach(flightViewModel.populerCitiesDomestic){ result in
                        Text(result.city.name)
                               .font(.callout)
                               .padding(.all,10)
                               .overlay( /// apply a rounded border
                               RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.7), lineWidth: 1))
                               .onTapGesture {
                                   flightViewModel.text = result.city.name
                                   flightViewModel.searchFlight()
                                   
                               }
                    }
                }
                
                
                HStack{
                    ForEach(flightViewModel.populerCitiesAbroad){ result in
                        Text(result.city.name)
                               .font(.callout)
                               .padding(.all,10)
                               .overlay( /// apply a rounded border
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(.gray.opacity(0.7), lineWidth: 1))
                               .onTapGesture {
                                   flightViewModel.text = result.city.name
                                   flightViewModel.searchFlight()
                               }
                    }
                }
            }
            
            .padding(.top,2)
            Spacer()
        }.padding(.horizontal)
    }
    
    func airportList(result:FlightVM) ->  some View {
        VStack{
            
                ForEach(result.city.airport) { airport in
                    
                    VStack{
                        HStack{
                            VStack(alignment:.leading){
                                Text("\(result.city.name),\(result.country)")
                                    .font(.callout)
                                Text(airport.name)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text(airport.code)
                                .font(.footnote)
                                .padding(.all,5)
                                .background(Color.gray.opacity(0.6))
                                .cornerRadius(10)
                            
                        }
                        Divider()
                    }.padding(.trailing)
                        .onTapGesture {
                            flightViewModel.selectedArrivel = City(id: result.city.id,
                                                                   name: result.city.name,
                                                                   code: result.city.code,
                                                                   airport: [airport])
                            flightViewModel.textSelectedArrivel = "\(result.city.name)/\(airport.name)"
                            flightViewModel.text = ""
                            self.dismiss()
                        }
                       
                       
                }
            
        }
    }
}

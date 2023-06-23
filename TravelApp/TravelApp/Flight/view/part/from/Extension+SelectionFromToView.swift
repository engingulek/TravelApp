//
//  Extension+SelectionFromToView.swift
//  TravelApp
//
//  Created by engin gülek on 4.06.2023.
//

import Foundation
import SwiftUI

extension SelectFromLocationView {
 
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
                            
                            flightViewModel.selectedDepature = City(id: result.city.id,
                                                                   name: result.city.name,
                                                                   code: result.city.code,
                                                                   airport: [airport])
                            flightViewModel.textSelectedDepature = "\(result.city.name)/\(airport.name)"
                            flightViewModel.text = ""
                            self.dismiss()
                        }
                }
            
        }
    }
}

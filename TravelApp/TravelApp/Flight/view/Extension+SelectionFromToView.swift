//
//  Extension+SelectionFromToView.swift
//  TravelApp
//
//  Created by engin gülek on 4.06.2023.
//

import Foundation
import SwiftUI

extension SelectFromAndToLocationView {
    var resultNil : some View {
        VStack(alignment:.leading,spacing: 10) {
            Text("Populer Cities")
                .fontWeight(.bold)
          
            HStack(spacing:15) {
                    ForEach(0...3,id:\.self) { i in
                        Text("Ankara")
                            .font(.callout)
                            .padding(.all,10)
                            .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.7), lineWidth: 1))
                    }
                }
            
              HStack(spacing:15) {
                      ForEach(0...2,id:\.self) { i in
                          Text("Londra")
                              .font(.callout)
                              .padding(.all,10)
                              .overlay( /// apply a rounded border
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke(.gray.opacity(0.7), lineWidth: 1))
                      }
                  }
            .padding(.top,2)
            Spacer()
        }.padding(.horizontal)
    }
    
    func airportList(result:Flight) ->  some View {
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
                }
            
        }
    }
}

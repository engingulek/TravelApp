//
//  SelectFromAndToLocationView.swift
//  TravelApp
//
//  Created by engin gülek on 2.06.2023.
//

import SwiftUI

struct SelectFromAndToLocationView: View {
    @ObservedObject private var viewModel = FlightViewModel()
    @Environment(\.dismiss) var dismiss
    @State var selectType = true
    var body: some View {
        VStack (alignment:.leading){
            VStack(spacing : 10) {
                Text(selectType ? "Select Departure Airport":"Select Arrivel Airport")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Text(selectType ?"From" : "To")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title2)
                        .onTapGesture { dismiss() }
                }.padding(.horizontal)
                
                TextField("Enter City and Airport", text: $viewModel.text)
                    .onChange(of: viewModel.text) { _ in
                        viewModel.searchFlight()
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
            if viewModel.text.count >= 3 {
                VStack(spacing:10){
                    
                    if !viewModel.cityAndCountryFilterList.isEmpty {
                        ForEach(viewModel.cityAndCountryFilterList) { result in
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
                                }
                                // MARK: - Airports List
                              airportList(result: result)
                            }
                            else{
                             airportList(result: result)
                            }
                        }
                    }else{
                        ForEach(viewModel.airportFilterList) { result in
                          airportList(result: result)
                        }
                    }
                    Spacer()
                }.padding(.leading)
            }else{
                resultNil
            }
        }
    }
}







struct SelectFromAndToLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectFromAndToLocationView(selectType: true)
    }
}




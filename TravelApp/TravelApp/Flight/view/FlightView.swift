//
//  FlightView.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import SwiftUI
import SwiftUI

struct FlightView: View {
    @EnvironmentObject var flightViewModel : FlightViewModel
    @EnvironmentObject var selectDepAndArViewModel : SelectDepAndArDateViewModel
    @EnvironmentObject var selectPassangerViewModel : SelectPassengerViewModel
    @EnvironmentObject var classViewModel : ClassViewModel
    
    @State private var selectedButton = 0
    @State private var isPresentedFrom = false
    @State private var isPresentedTo = false
    @State private var isPresentedDateDepature = false
    @State private var isPresentedDateArrivel = false
    @State private var isPresentedPassanger = false
    @State private var isPresenterClass = false
    @State private var showingAlert = false
    @State private var isPresentedFlightTickerSearcView = false
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                button
                fromCityAirport
                    .onTapGesture {
                        self.isPresentedFrom = true
                    }
                    .fullScreenCover(isPresented:$isPresentedFrom) {
                        SelectFromLocationView()
                    
                }
                Image(systemName: "arrow.up.arrow.down.circle")
                    .font(.title)
                    .foregroundColor(Color.blue).onTapGesture {
                        flightViewModel.changeFromAndTo()
                    }
            
                toCityAirport
                    .onTapGesture {
                        self.isPresentedTo = true
                        
                    }
                    .fullScreenCover(isPresented:$isPresentedTo) {
                        SelectToLocationView()
                }
                depatureDate.onTapGesture {
                    self.isPresentedDateDepature = true
                }.sheet(isPresented: $isPresentedDateDepature) {
                   SelectDepartureDate()
                        .presentationDetents([.height(UIScreen.main.bounds.height / 1.5),.fraction(0.75)])
                        
                }
                selectedButton == 1 ?
                returnDate
                    .onTapGesture {
                        self.isPresentedDateArrivel = true
        
                    }.sheet(isPresented: $isPresentedDateArrivel, content: {
                        SelectArrvivelDate(startArrivelDate: selectDepAndArViewModel.selectedDepatureDate)
                          .presentationDetents([.height(UIScreen.main.bounds.height / 1.5),.fraction(0.75)])
                    })
                
                : nil
                HStack(spacing: 5) {
                    passanger
                        .onTapGesture {
                            self.isPresentedPassanger = true
                        }.fullScreenCover(isPresented: $isPresentedPassanger) {
                            SelectPassangerView()
                        }
                    classType
                        .onTapGesture {
                            self.isPresenterClass = true
                        }.sheet(isPresented: $isPresenterClass) {
                            ClassView()
                                .presentationDetents([.height(UIScreen.main.bounds.height / 4),.fraction(0.25)])
                          
                        }
                }
                .padding(.horizontal)
                searchButton
            }
            .padding(.bottom)
            
        }.onAppear{
            print("FlightView \(selectDepAndArViewModel.selectedArrivelDate)")
        }
        
      
    }
    
    var button : some View {
       
              HStack(spacing:20) {
                  Button {
                      selectedButton = 0
                  } label: {
                      Text("On Way")
                          .foregroundColor(selectedButton == 0 ?
                              .white : Color.gray)
                  }.padding()
                      .background(selectedButton == 0 ? Color.blue : nil)
                      .cornerRadius(20)
                  Button {
                      selectedButton = 1
                  } label: {
                      Text("Rounded Trip")
                          .foregroundColor(selectedButton == 1 ?
                              .white : Color.gray)
                  }.padding()
                      .background(selectedButton == 1 ? Color.blue : nil)
                      .cornerRadius(20)
              }.padding(.top)
          
      }
    
    var fromCityAirport : some View {
    
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "airplane.departure")
                    VStack(alignment:.leading) {
                        Text("From")
                            .foregroundColor(Color.gray)
                        Text(flightViewModel.textSelectedDepature)
                    }
                    
                    Spacer()
                }.padding(.all,10)
     
                    .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 1)
                )
            }.padding([.horizontal,.top])
            
        
    }
    
    var toCityAirport : some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "airplane.arrival")
                VStack(alignment:.leading) {
                    Text("To")
                        .foregroundColor(Color.gray)
                    Text(flightViewModel.textSelectedArrivel)
                }
                
                Spacer()
            }.padding(.all,10)
 
                .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }.padding(.horizontal)
            .padding(.top,5)
    }
    
    
    
    
    var depatureDate : some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                VStack(alignment:.leading) {
                    Text("Date")
                        .foregroundColor(Color.gray)
                    Text(selectDepAndArViewModel.selectedDepatureDate.dateFormatted())
                }
                
                Spacer()
            }.padding(.all,10)
 
                .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }.padding([.horizontal,.top])
    }
    
    var returnDate : some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                VStack(alignment:.leading) {
                    Text("Return Date")
                        .foregroundColor(Color.gray)
                    Text((selectDepAndArViewModel.selectedArrivelDate.dateFormatted() ) as String)
                }
                
                Spacer()
            }.padding(.all,10)
 
                .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }.padding([.horizontal,.top])
    }
    
    var passanger : some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle")
                VStack(alignment:.leading) {
                    Text("Passenger")
                        .foregroundColor(Color.gray)
                    Text("\(selectPassangerViewModel.totalCount) Passenger")
                }
                
                Spacer()
            }.padding(.all,10)
 
                .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }.padding(.top)
    }
    
    var classType : some View {
        VStack(alignment: .leading) {
           
            HStack {
                Image(systemName: "gearshape.fill")
                HStack {
                    VStack(alignment:.leading) {
                        Text("Class")
                            .foregroundColor(Color.gray)
                        Text(classViewModel.selectedClassType)
                    }
                   
                 
                }
                
                Spacer()
            }.padding(.all,10)
 
                .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }.padding(.top)
    }
    
    var searchButton : some View {
        Button {
            do {
                 try flightViewModel.fromLocationControl(flightViewModel.textSelectedDepature)
                 try flightViewModel.toLocationControl(flightViewModel.textSelectedArrivel)
                try flightViewModel.fromToLocationCompare(flightViewModel.selectedDepature!, flightViewModel.selectedArrivel!)
           
                self.isPresentedFlightTickerSearcView = true
                if selectedButton == 0{
                  //  selectDepAndArViewModel.selectedArrivelDate = nil
                }

            }catch{
                self.showingAlert = true
                self.alertMessage = error.localizedDescription
                
            }
        } label: {
            Text("Search Flight")
                .foregroundColor(Color.white)
                .font(.title3)
                .frame(width: UIScreen.main.bounds.width / 2)
        }.padding()
            .background(Color.blue)
            .cornerRadius(20)
            .padding(.top)
            .alert(isPresented: $showingAlert) {
                Alert( title: Text("Important message"),
                       message: Text(alertMessage),
                       dismissButton: .default(Text("Cancel"))
                           )
            }.fullScreenCover(isPresented: $isPresentedFlightTickerSearcView) {
                FlightTicketDeptureView(deptureDate: selectDepAndArViewModel.selectedArrivelDate,
                                       returnDate: selectDepAndArViewModel.selectedDepatureDate,
                                       deptureCity: flightViewModel.selectedDepature,
                                       arrivelCity: flightViewModel.selectedArrivel,
                                       
                                       passangerList: selectPassangerViewModel.passengerList,
                                        selectedButton : self.selectedButton
                )
            }
          

    }
}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView().environmentObject(FlightViewModel())
            .environmentObject(SelectDepAndArDateViewModel())
            .environmentObject(SelectPassengerViewModel())
            .environmentObject(ClassViewModel())
            
    }
}

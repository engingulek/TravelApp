//
//  FlightView.swift
//  TravelApp
//
//  Created by engin gülek on 1.06.2023.
//

import SwiftUI

struct FlightView: View {
    @State private var selectedButton = 0
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                button
                fromToDesign
                date
                selectedButton == 1 ? returnDate : nil
                HStack(spacing: 5) {
                    passanger
                    classType
                }
                .padding(.horizontal)
                searchButton
            }
            .padding(.bottom)
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
    
    var fromToDesign : some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "airplane.departure")
                    VStack(alignment:.leading) {
                        Text("From")
                            .foregroundColor(Color.gray)
                        Text("City/Airport")
                    }
                    
                    Spacer()
                }.padding(.all,10)
     
                    .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 1)
                )
            }.padding([.horizontal,.top])
            
            Image(systemName: "arrow.up.arrow.down.circle")
                .font(.title)
                .foregroundColor(Color.blue)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "airplane.arrival")
                    VStack(alignment:.leading) {
                        Text("To")
                            .foregroundColor(Color.gray)
                        Text("City/Airport")
                    }
                    
                    Spacer()
                }.padding(.all,10)
     
                    .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 1)
                )
            }.padding(.horizontal)
                .padding(.top,5)
        }
            
    }
    
    var date : some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                VStack(alignment:.leading) {
                    Text("Date")
                        .foregroundColor(Color.gray)
                    Text("02 Jun 2023")
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
                    Text("02 Jun 2023")
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
                    Text("1 Passenger")
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
                        Text("Economy")
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
            
        } label: {
            Text("Search Flight")
                .foregroundColor(Color.white)
                .font(.title3)
                .frame(width: UIScreen.main.bounds.width / 2)
        }.padding()
            .background(Color.blue)
            .cornerRadius(20)
            .padding(.top)
          

    }
}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}

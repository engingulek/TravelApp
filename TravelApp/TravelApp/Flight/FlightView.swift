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
        VStack(spacing : 30) {
            button
            fromTO
            
            HStack {
                depatureDate
                selectedButton == 0 ? nil :
                HStack {
                    Image(systemName: "calender.circle")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    retuenDate
                }
              
            }
            
            
           
     
        }
        
       
    }
    // MARK: - Button Design
    var button : some View {
        VStack {
            HStack(spacing:20) {
                Button {
                    selectedButton = 0
                } label: {
                    Text("On Way")
                        .foregroundColor(selectedButton == 0 ?
                            .black : Color.gray)
                }.padding()
                    .background(selectedButton == 0 ? Color.white : nil)
                    .cornerRadius(20)
                Button {
                    selectedButton = 1
                } label: {
                    Text("Rounded Trip")
                        .foregroundColor(selectedButton == 1 ?
                            .black : Color.gray)
                }.padding()
                    .background(selectedButton == 1 ? Color.white : nil)
                    .cornerRadius(20)
                

            }.background(Color("backgroundTabbar"))
        }
    }
    
    // MARK: - From To Design
    var fromTO : some View {
        HStack {
            
            VStack(spacing:3){
                Text("Please Select")
                    .font(.callout)
                Text("From")
                    .font(.largeTitle)
                Text("City/Airport")
                    .font(.callout)
            }.padding(.all,20)
            .background(Color.white)
                .cornerRadius(20)
            Image(systemName: "airplane.circle")
                .font(.largeTitle)
                .foregroundColor(.blue)
            VStack(spacing:3) {
                Text("Please Select")
                    .font(.callout)
                Text("To")
                    .font(.largeTitle)
                Text("City/Airport")
                    .font(.callout)
            }
            .padding(.all,20)
            .background(Color.white)
                .cornerRadius(20)
            
        }
    }
    
    var depatureDate : some View {
        HStack {
            
            VStack(spacing:3){
                Text("Departure Date")
                    .font(.callout)
                HStack{
                    Text("2")
                        .font(.largeTitle)
                    VStack{
                        Text("July")
                        Text("Sunday")
                    }.font(.caption)
                        .foregroundColor(Color.gray)
                }
            }.padding(.all,20)
            .background(Color.white)
                .cornerRadius(20)
            
        }
    }
    
    var retuenDate : some View {
        HStack {
            
            VStack(spacing:3){
                Text("Retuen Date")
                    .font(.callout)
                HStack{
                    Text("2")
                        .font(.largeTitle)
                    VStack{
                        Text("July")
                        Text("Sunday")
                    }.font(.caption)
                        .foregroundColor(Color.gray)
                }
            }.padding(.all,20)
            .background(Color.white)
                .cornerRadius(20)
            
        }
    }

}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}

/**
 
 

 .background(
     RoundedRectangle(cornerRadius: 25)
         .fill(Color.white)
         .shadow(color: .gray, radius: 2, x: 0, y: 2)
)

 */

//
//  FlightTicketCell.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI

struct FlightTicketCell: View {
    var result : FlightTicketVM?
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                HStack{
                    Image(systemName: "airplane")
                    Text(result!.airline)
                }.font(.subheadline)
                Spacer()
                HStack{
                    Text(result!.deptureClock)
                    Image(systemName: "arrow.right")
                    Text(result!.arrivelClock)
                }.font(.subheadline)
                
            }
            HStack{
                HStack{
                    Text(result!.from.airport.code)
                    Image(systemName: "chevron.right")
                    Text(result!.to.airport.code)
                }.font(.subheadline)
                Spacer()
                HStack{
                    Image(systemName: "bag.fill")
                    Text("\(result!.bagWeight) kg/person")
                }.font(.subheadline)
            }
            HStack {
                Spacer()
                Text("Total Amount \(flightTicketSearchViewModel.calculateTotalAmount(result!.price)) ₺")
            } .font(.caption)
            VStack{
                Divider()
                    .frame(
                           height: 1)
                .overlay(.black)
            }.padding(.top)
            HStack{
                Text("\(result!.from.airport.name) -")
                Text("\(result!.to.airport.name)")
                Spacer()
            }.font(.caption2)
        }.padding([.top,.bottom],20)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(20)
    }
}

struct FlightTicketCell_Previews: PreviewProvider {
    static var previews: some View {
        FlightTicketCell()
            .environmentObject(FlightTicketSearchViewModel())
    }
}

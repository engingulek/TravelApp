//
//  FlightTicketReturnView.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI

struct FlightTicketReturnView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresenterFilterView = false
    @State private var isPresentedFlightInfoView = false
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    @EnvironmentObject var selectDepAndArViewModel : SelectDepAndArDateViewModel
    var deptureResult  : FlightTicketVM?
    var passengerList : [String : Int]?
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    /// header
                    header
                    /// Route Detail
                    routeDetail
                    /// dateList
                    dateList
                }.frame(width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height / 3)
                .background(Color.blue)
                .roundedCorner(20, corners: [.bottomLeft,.bottomRight])
                .edgesIgnoringSafeArea(.top)
                
                if flightTicketSearchViewModel.flightTicketReturn.count == 0 {
                    VStack{
                        Text("No Ticket")
                    }
                }else{
                    // MARK: - Ticket List
                    VStack {
                        HStack{
                            Text("Please select your return flight")
                                .foregroundColor(Color.blue)
                            Spacer()
                        }
                        ScrollView(showsIndicators: false) {
                            searchTicketInfo
                        }
                    }.padding(.horizontal)
                        .edgesIgnoringSafeArea(.bottom)
                }
                Spacer()
                
            }.background(Color("backgroundTabbar"))
                .onAppear {
                    flightTicketSearchViewModel.listDateLater30(forCurrentDate: flightTicketSearchViewModel.getDeptureDate!)
                    //print(selectDepAndArViewModel.selectedDepatureDate)
                  //  print("getDeptureDate \(flightTicketSearchViewModel.getDeptureDate)")
                }.task {
                    await flightTicketSearchViewModel.getDataReturnFlightTickets()
                }
        }
    }
}

struct FlightTicketReturnView_Previews: PreviewProvider {
    static var previews: some View {
        FlightTicketReturnView()
            .environmentObject(FlightTicketSearchViewModel())
            .environmentObject(SelectDepAndArDateViewModel())
    }
}


extension FlightTicketReturnView {
    private var header : some View {
        HStack{
            Image(systemName: "arrowtriangle.backward")
                .foregroundColor(.white)
                .font(.title2)
                .onTapGesture {
                    self.dismiss()
                }
            Spacer()
           
        }.padding(.horizontal)
            .padding(.bottom,5)
            .padding(.top,5)
    }
    
    private var routeDetail : some View {
        VStack{
            HStack{
                Text(flightTicketSearchViewModel.arrivelCity?.name ?? "None")
                Spacer()
                Text(flightTicketSearchViewModel.deptureCity?.name ?? "None")
            }.foregroundColor(Color.white)
            
            HStack{
                Text(flightTicketSearchViewModel.arrivelCity!.airport.count >= 2 ? flightTicketSearchViewModel.arrivelCity!.code : flightTicketSearchViewModel.arrivelCity!.airport[0].code)
                Spacer()
                ZStack{
                    VStack{
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2,
                                   height: 1)
                            .overlay(.white)
                    }
                    Image(systemName: "airplane")
                        .foregroundColor(Color.white)
                        .font(.title2)
                }
                Spacer()
                Text(flightTicketSearchViewModel.deptureCity!.airport.count >= 2 ? flightTicketSearchViewModel.deptureCity!.code : flightTicketSearchViewModel.deptureCity!.airport[0].code)
                
            }.foregroundColor(Color.white)
                .font(Font.headline.bold())
            
        }.padding(.horizontal)
    }
    
    private var dateList : some View {
        VStack {
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(flightTicketSearchViewModel.dateList,id:\.self) { futureDate in
                        VStack {
                            Text(futureDate.dayMonthFormat().0)
                                .font(.title)
                            Text(futureDate.dayMonthFormat().1)
                        }
                        .foregroundColor((flightTicketSearchViewModel.getReturnDate?.dayMonthFormat())! == futureDate.dayMonthFormat() ?
                            .blue : .white )
                        .padding()
                        .background(
                            (flightTicketSearchViewModel.getReturnDate?.dayMonthFormat())! == futureDate.dayMonthFormat() ?
                                .white :  Color.white.opacity(0.2))
                        .cornerRadius(20)
                        .onTapGesture {
                            flightTicketSearchViewModel.getReturnDate = futureDate
                            selectDepAndArViewModel.selectedArrivelDate = futureDate
                            Task {
                                await self.flightTicketSearchViewModel.getDataReturnFlightTickets()
                            }
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
    
    private var searchTicketInfo : some View {
        VStack(spacing:20) {
            ForEach(flightTicketSearchViewModel.flightTicketReturn) { result in
                FlightTicketCell(result: result)
                    .onTapGesture {
                        self.isPresentedFlightInfoView = true
                    }.navigationDestination(isPresented: $isPresentedFlightInfoView){
                        FlightInfoView(deptureFlightTicket:deptureResult , returnFlightTicket: result,passengerList: passengerList)
                    }
            }
            
        }
    }
}

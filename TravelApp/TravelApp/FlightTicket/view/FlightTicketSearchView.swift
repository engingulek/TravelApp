//
//  FlightTicketView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI
struct FlightTicketSearchView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    @EnvironmentObject var selectDepAndArViewModel : SelectDepAndArDateViewModel
    var deptureDate:Date?
    var returnDate:Date?
    var deptureCity : City?
    var arrivelCity: City?
    

    var body: some View {
     
        VStack{
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
                
            // ticket list
            VStack{
                HStack{
                    Text("Please select your outbound flight")
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                ScrollView(showsIndicators: false) {
                   // searchTicketInfo
           
                }
                
            }.padding(.horizontal)
                .edgesIgnoringSafeArea(.bottom)
            
        }.background(Color("backgroundTabbar"))
            .onAppear{
                flightTicketSearchViewModel.getDeptureDate = deptureDate
               
                 flightTicketSearchViewModel.listDateLater20()
            }
            .task {
                await flightTicketSearchViewModel.getDataFlightTickets()
              
            }
    }
}

struct FlightTicketSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightTicketSearchView()
            .environmentObject(FlightTicketSearchViewModel())
            .environmentObject(SelectDepAndArDateViewModel())
        
            
    }
}

extension FlightTicketSearchView {
    private var header : some View {
        HStack{
            Image(systemName: "arrowtriangle.backward")
                .foregroundColor(.white)
                .font(.title2)
                .onTapGesture {
                    self.dismiss()
                }
            Spacer()
            Image(systemName: "slider.vertical.3")
                .foregroundColor(.white)
                .font(.title2)
        }.padding(.horizontal)
            .padding(.bottom,5)
            .padding(.top,5)
    }
    
    private var routeDetail : some View {
        VStack{
            HStack{
                Text(deptureCity?.name ?? "None")
                Spacer()
                Text(arrivelCity?.name ?? "None")
            }.foregroundColor(Color.white)
            
            HStack{
                Text(deptureCity!.airport.count >= 2 ? deptureCity!.code : deptureCity!.airport[0].code)
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
                Text(arrivelCity!.airport.count >= 2 ? arrivelCity!.code : arrivelCity!.airport[0].code)
                    
            }.foregroundColor(Color.white)
                .fontWeight(.semibold)
                
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
                        .foregroundColor((flightTicketSearchViewModel.getDeptureDate?.dayMonthFormat())! == futureDate.dayMonthFormat() ?
                            .blue : .white )
                        .padding()
                        .background(
                            (flightTicketSearchViewModel.getDeptureDate?.dayMonthFormat())! == futureDate.dayMonthFormat() ?
                                .white :  Color.white.opacity(0.2))
                        .cornerRadius(20)
                        .onTapGesture {
                            flightTicketSearchViewModel.getDeptureDate = futureDate
                            selectDepAndArViewModel.selectedDepatureDate = futureDate
                            print(flightTicketSearchViewModel.getDeptureDate!.dayMonthFormat().0)
                            print(futureDate.dayMonthFormat().0)
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
    
    private var searchTicketInfo : some View {
        VStack(spacing: 20) {
            ForEach(flightTicketSearchViewModel.flightTickets) { result in
                VStack(spacing: 10) {
                    HStack{
                        HStack{
                            Image(systemName: "airplane")
                            Text(result.airline)
                        }.font(.subheadline)
                        Spacer()
                        HStack{
                            Text(result.deptureClock)
                            Image(systemName: "arrow.right")
                            Text(result.arrivelClock)
                        }.font(.subheadline)
                        Spacer()
                    }
                    HStack{
                        HStack{
                            Text(result.from.airport.code)
                            Image(systemName: "chevron.right")
                            Text(result.to.airport.code)
                        }.font(.subheadline)
                        Spacer()
                        HStack{
                            Image(systemName: "bag.fill")
                            Text("\(result.bagWeight) kg/person")
                        }.font(.subheadline)
                    }
                    VStack{
                        Divider()
                            .frame(
                                   height: 1)
                        .overlay(.black)
                    }.padding(.top)
                    HStack{
                        Text("\(result.from.airport.name) -")
                        Text("\(result.to.airport.name)")
                        Spacer()
                    }.font(.caption2)
                }.padding([.top,.bottom],20)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(20)
                
                   
            }
        }
    }
   
}

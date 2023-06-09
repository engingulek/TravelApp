//
//  FlightTicketView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI
struct FlightTicketDeptureView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    @EnvironmentObject var selectDepAndArViewModel : SelectDepAndArDateViewModel
    @State private var isPresenterFilterView = false
    @State private var isPresentedFlightInfoView = false
    @State private var isPresentedFlightTicketReturn = false
    var deptureDate:Date?
    var returnDate:Date?
    var deptureCity : City?
    var arrivelCity: City?
    var passangerList: [String:Int] = [:]
    var selectedButton:Int?
    
    var body: some View {
        
        NavigationStack {
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
                
                
                if flightTicketSearchViewModel.flightTicketsDepture.count == 0 {
                    VStack {
                        Text("No Ticket ")
                    }
                }else{
                    // ticket list
                    VStack{
                        HStack{
                            Text("Please select your outbound flight")
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
                .onAppear{
                    flightTicketSearchViewModel.getDeptureDate = deptureDate
                    flightTicketSearchViewModel.getReturnDate = returnDate
                    flightTicketSearchViewModel.listDateLater30(forCurrentDate: Date.now)
                    //flightTicketSearchViewModel.returnDate = returnDate
                    flightTicketSearchViewModel.deptureCity = deptureCity
                    //flightTicketSearchViewModel.deptureDate = deptureDate
                    flightTicketSearchViewModel.arrivelCity = arrivelCity
                    flightTicketSearchViewModel.passangerList = passangerList
                    
                    
                }
                .task {
                    await flightTicketSearchViewModel.getDataDeptureFlightTickets()
                    
                }
            
        }
    }
}

struct FlightTicketSearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        FlightTicketDeptureView()
            .environmentObject(FlightTicketSearchViewModel())
            .environmentObject(SelectDepAndArDateViewModel())
        
        
        
        
        
        
    }
}

extension FlightTicketDeptureView {
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
                .onTapGesture {
                    self.isPresenterFilterView = true
                }.sheet(isPresented: $isPresenterFilterView) {
                    FilterView()
                        .presentationDetents([.height(UIScreen.main.bounds.height / 2),.fraction(0.5)])
                    
                }
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
                            print(futureDate)
                            Task{
                                await self.flightTicketSearchViewModel.getDataDeptureFlightTickets()
                            }
                           
                            
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
    
    private var searchTicketInfo : some View {
        VStack(spacing: 20) {
            ForEach(flightTicketSearchViewModel.flightTicketsDepture) { result in
                
                FlightTicketCell(result: result)
                    .onTapGesture {
                        if selectedButton == 0 {
                            self.isPresentedFlightInfoView = true
                            
                            
                        }else{
                            self.isPresentedFlightTicketReturn = true
                            self.flightTicketSearchViewModel.selectedDeptureTicket = result
                        }
                    }.navigationDestination(isPresented: $isPresentedFlightInfoView){
                        FlightInfoView(deptureFlightTicket:result , returnFlightTicket: nil,passengerList:passangerList)
                    }.navigationDestination(isPresented: $isPresentedFlightTicketReturn) {
                        FlightTicketReturnView(deptureResult:result,passengerList: passangerList)
                    }
            }
        }
    }
    
}

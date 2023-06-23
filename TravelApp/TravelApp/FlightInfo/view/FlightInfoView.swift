//
//  FlightInfo.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI

struct FlightInfoView: View {
    @EnvironmentObject var flightInfoViewModel : FlightInfoViewModel
    @EnvironmentObject var flightTicketSearchViewModel : FlightTicketSearchViewModel
    @State  private var isPresentedConfirm = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var deptureFlightTicket : FlightTicketVM?
    var returnFlightTicket : FlightTicketVM?
    var passengerList : [String:Int]?
    var body: some View {
        ZStack {
            Color("backgroundTabbar")
                .ignoresSafeArea()
            // header
            VStack {
                VStack{
                    Text("Ticket Info")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color.white)
                }.frame(width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height / 6)
                .background(Color.blue)
                
                .edgesIgnoringSafeArea(.top)
                Spacer()
            }
            // ticket info
            
            ScrollView {
                VStack(spacing:10){
                    deptureTicketInfo
                    if returnFlightTicket != nil {
                        returnTicketInfo
                    }
                    
                    ZStack(alignment:.top){
                        priceInfo
                            .padding(.top)
                        Text("Price Info")
                            .padding(.vertical,5)
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button("Confirm") {
                        self.isPresentedConfirm = true
                    }
                    .padding()
                    
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .navigationDestination(isPresented: $isPresentedConfirm) {
                        PassengerAndPayInfo(passengerList: (passengerList?.dictionaryToArray())!)
                    }
                    
                }
            }.padding(.top,80)
                .toolbar {
                    ToolbarItem(placement:.navigationBarLeading) {
                        Image(systemName: "arrowtriangle.backward")
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
            
            
        }.navigationBarBackButtonHidden(true)
        
        
        
        
    }
    
    private var deptureTicketInfo : some View {
        VStack(spacing:10){
            /// date
            HStack{
                Text(deptureFlightTicket!.date)
                
                Spacer()
            }.font(.caption2)
            
            
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black)
            }
            
            // airlines and classType
            HStack{
                HStack{
                    Image(systemName: "airplane")
                    Text("Airlines")
                }
                
                Spacer()
                Text(deptureFlightTicket!.classType)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            }.font(.footnote)
            
            // code clock
            HStack {
                Text("\(deptureFlightTicket!.from.airport.code) \(deptureFlightTicket!.deptureClock)")
                Spacer()
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(Color.blue)
                    Text(flightInfoViewModel.calculateTravelTime(deptureClock: deptureFlightTicket!.deptureClock.stringToClock(), arrivelClock: deptureFlightTicket!.arrivelClock.stringToClock()))
                        .foregroundColor(Color.black.opacity(0.7))
                }.font(.footnote)
                
                Spacer()
                Text("\(deptureFlightTicket!.to.airport.code)/\(deptureFlightTicket!.arrivelClock)")
            }
            
            HStack {
                Text("\(deptureFlightTicket!.from.city)/\(deptureFlightTicket!.from.airport.name)")
                Spacer()
                Text("\(deptureFlightTicket!.to.city)/\(deptureFlightTicket!.to.airport.name)")
            }
            .font(.caption)
            
            HStack{
                Text("Bag:\(deptureFlightTicket!.bagWeight) kg")
                    .font(.caption)
                Spacer()
            }
        }.padding(.horizontal)
            .padding([.top,.bottom],10)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
    private var returnTicketInfo : some View {
        VStack(spacing:10){
            /// date
            HStack{
                Text(returnFlightTicket!.date)
                
                Spacer()
            }.font(.caption2)
            
            
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black)
            }
            
            // airlines and classType
            HStack{
                HStack{
                    Image(systemName: "airplane")
                    Text("Airlines")
                }
                
                Spacer()
                Text(returnFlightTicket!.classType)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            }.font(.footnote)
            
            // code clock
            HStack {
                Text("\(returnFlightTicket!.from.airport.code) \(returnFlightTicket!.deptureClock)")
                Spacer()
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(Color.blue)
                    Text(flightInfoViewModel.calculateTravelTime(deptureClock: returnFlightTicket!.deptureClock.stringToClock(), arrivelClock: returnFlightTicket!.arrivelClock.stringToClock()))
                        .foregroundColor(Color.black.opacity(0.7))
                }.font(.footnote)
                
                Spacer()
                Text("\(returnFlightTicket!.to.airport.code) \(returnFlightTicket!.arrivelClock)")
            }
            
            HStack {
                Text("\(returnFlightTicket!.from.city)/\(returnFlightTicket!.from.airport.name)")
                Spacer()
                Text("\(returnFlightTicket!.to.city)/\(returnFlightTicket!.to.airport.name)")
            }
            .font(.caption)
            
            HStack{
                Text("Bag:\(returnFlightTicket!.bagWeight) kg")
                    .font(.caption)
                Spacer()
            }
        }.padding(.horizontal)
            .padding([.top,.bottom],10)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
    private var priceInfo : some View {
        VStack {
            HStack{
                Text("Passenger")
                Spacer()
                Text("Price")
                
            }.fontWeight(.semibold)
            VStack{
                Text("Depture")
                    .fontWeight(.bold)
                ForEach(Array(passengerList!.keys) ,id: \.self) { passenger in
                    VStack(spacing:15) {
                        passengerList![passenger]! != 0 ?
                        
                        HStack{
                            Text("\(passengerList![passenger]!) \(passenger) ")
                            Spacer()
                            Text("\(flightInfoViewModel.returnPricePassenger(count:passengerList![passenger]!,passenger:passenger , priceList: deptureFlightTicket!.price)) ₺")
                            
                        } : nil
                    }
                }
                HStack(spacing:2){
                    Spacer()
                    Text("Total:")
                    Text("\(flightInfoViewModel.totalAmount(passengerList!, deptureFlightTicket!.price, returnFlightTicket?.price).0) ₺")
                }.font(.callout)
                    .fontWeight(.semibold)
            }
            
            returnFlightTicket != nil ? VStack {
                VStack{
                    Text("Return")
                        .fontWeight(.bold)
                    ForEach(Array(passengerList!.keys) ,id: \.self) { passenger in
                        VStack(spacing:15) {
                            passengerList![passenger]! != 0 ?
                            
                            HStack{
                                Text("\(passengerList![passenger]!) \(passenger) ")
                                Spacer()
                                Text("\(flightInfoViewModel.returnPricePassenger(count:passengerList![passenger]!,passenger:passenger , priceList: returnFlightTicket!.price)) ₺")
                                
                            } : nil
                        }
                    }
                    HStack(spacing:2){
                        Spacer()
                        Text("Total:")
                        Text("\(flightInfoViewModel.totalAmount(passengerList!, deptureFlightTicket!.price, returnFlightTicket?.price).1) ₺")
                    }.font(.callout)
                        .fontWeight(.semibold)
                }
            } : nil
            
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black)
            }
            HStack{
                HStack(spacing:2){
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.blue)
                    Text("\(flightInfoViewModel.returnPersonCount(passenger:passengerList! )) Person")
                }
                Spacer()
                
                HStack(spacing:3){
                    Spacer()
                    Text("Total Amount:")
                    Text("\(flightInfoViewModel.totalAmount(passengerList!, deptureFlightTicket!.price, returnFlightTicket?.price).2) ₺")
                }
            }.font(.callout)
            
        }.padding(.horizontal)
            .padding([.top,.bottom],10)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct FlightInfo_Previews: PreviewProvider {
    static var previews: some View {
        FlightInfoView()
            .environmentObject(FlightInfoViewModel())
            .environmentObject(FlightTicketSearchViewModel())
        
    }
}


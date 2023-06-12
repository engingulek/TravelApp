//
//  FlightInfo.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI

struct FlightInfoView: View {
  @State  private var isPresentedConfirm = false
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
                    returnTicketInfo
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
                        .fullScreenCover(isPresented: $isPresentedConfirm) {
                            Text("dad")
                        }
                    
                }
            }.padding(.top,80)
            

        }
        
        
    }
    
    private var deptureTicketInfo : some View {
        VStack(spacing:10){
            /// date
            HStack{
                Text("Jun 13 2023")
                
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
                Text("Economy")
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            }.font(.footnote)
            
            // code clock
            HStack {
                Text("SAW 14:50")
                Spacer()
                HStack {
                    Image(systemName: "clock.circle")
                        .foregroundColor(Color.blue)
                    Text("40 dk")
                        .foregroundColor(Color.black.opacity(0.7))
                }.font(.footnote)
                
                Spacer()
                Text("ESB 15:30")
            }
            
            HStack {
                Text("İstanbul/Sabiha Gökçen")
                Spacer()
                Text("Ankara/Esenboğa")
            }
            .font(.caption)
            
            HStack{
                Text("Bag:15 kg")
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
                Text("Jun 13 2023")
                
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
                Text("Economy")
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            }.font(.footnote)
            
            // code clock
            HStack {
                Text("SAW 14:50")
                Spacer()
                HStack {
                    Image(systemName: "clock.circle")
                        .foregroundColor(Color.blue)
                    Text("40 dk")
                        .foregroundColor(Color.black.opacity(0.7))
                }.font(.footnote)
                
                Spacer()
                Text("ESB 15:30")
            }
            
            HStack {
                Text("İstanbul/Sabiha Gökçen")
                Spacer()
                Text("Ankara/Esenboğa")
            }
            .font(.caption)
            
            HStack{
                Text("Bag:15 kg")
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
            ForEach(0..<3) { _ in
                VStack(spacing:15) {
                    HStack{
                        Text("1 Adult")
                        Spacer()
                        Text("500₺")
                    }
                }
            }
            
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
                    Text("3 Person")
                }
                Spacer()
                Text("Toral Amount : 1500 ₺")
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
    }
}


/*extension FlightInfoView {
 private var header:some View {
 VStack {
 VStack{
 Text("Travell App")
 .font(.title)
 .fontWeight(.bold)
 .foregroundColor(Color.white)
 }.padding(.horizontal)
 .padding(.bottom,5)
 .padding(.top,5)
 }.frame(width: UIScreen.main.bounds.width,
 height: UIScreen.main.bounds.height / 6)
 .background(Color.blue)
 
 .edgesIgnoringSafeArea(.top)
 }
 }*/

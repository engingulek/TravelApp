//
//  PassengerAndPayInfo.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI




struct PassengerAndPayInfo: View {
    @State  private var isPresentedConfirm = false
    @State private var mobilePhone = ""
    @State private var email = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var dateOfBirth = ""
    @State private var idNo = ""
    @State private var passportNo = ""
    @State private var cartNo = ""
    @State private var expirationDate = ""
    @State private var cvc2 = ""
    @State private var tcCitizenNo = false
    @State private var nationality = ""
    
    
      @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
      var body: some View {
          ZStack {
              Color("backgroundTabbar")
                  .ignoresSafeArea()
              // ticket info
              
              ScrollView {
                  VStack(spacing:10){
                    
                      ZStack(alignment:.top){
                              contactInfo
                              .padding(.top,20)
                              Text("Contact Information")
                              .padding(.vertical,5)
                              .padding(.horizontal)
                              .background(Color.blue)
                              .cornerRadius(10)
                              .fontWeight(.semibold)
                              .foregroundColor(.white)
                          }
                      
                   
                          
                          ZStack(alignment:.top){
                                  passengerInformation
                                  .padding(.top,20)
                                  Text("Passenger Information")
                                  .padding(.vertical,5)
                                  .padding(.horizontal)
                                  .background(Color.blue)
                                  .cornerRadius(10)
                                  .fontWeight(.semibold)
                                  .foregroundColor(.white)
                              }
                      
                      
                      ZStack(alignment:.top){
                              paymentInfo
                              .padding(.top,20)
                              Text("Payment Information")
                              .padding(.vertical,5)
                              .padding(.horizontal)
                              .background(Color.blue)
                              .cornerRadius(10)
                              .fontWeight(.semibold)
                              .foregroundColor(.white)
                          }
                      
             
                      Button("Pay") {
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
                              PassengerAndPayInfo()
                          }
                      
                  }
              }.padding(.top)
                  .toolbar {
                      ToolbarItem(placement:.navigationBarLeading) {
                          Image(systemName: "arrowtriangle.backward")
                              .foregroundColor(Color.white)
                              .onTapGesture {
                                  self.presentationMode.wrappedValue.dismiss()
                              }
                      }
                  }.navigationBarBackButtonHidden(true)
              

          }
      }
    
}

struct PassengerAndPayInfo_Previews: PreviewProvider {
    static var previews: some View {
        PassengerAndPayInfo()
    }
}


extension PassengerAndPayInfo {
    private var contactInfo : some View {
        VStack(alignment:.leading) {
            
            Text("Mobil Phone")
            TextField("5xx xxx xx xx", text: $mobilePhone)
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black.opacity(0.4))
            }
            
            Text("E-Mail")
            TextField("Enter email", text: $email)
            
        }.padding(.horizontal)
            .padding([.top,.bottom],20)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
    
    private var passengerInformation : some View {
        
        VStack {
            ScrollView(.horizontal,showsIndicators: false){
                HStack {
                    ForEach(PassagersType.allCases,id:\.self) { passenger in
                        Text(passenger.description.0)
                            .font(.caption2)
                            .padding(.horizontal,15)
                            .padding(.vertical,10)
                            .background(Color.white)
                            .foregroundColor(Color.red)
                            .border(Color.red,width: 2)
                            .cornerRadius(6)
                        
                        
                        
                    }
                }.padding(.horizontal)
                
            }.padding(.top,5)
            VStack(alignment:.leading) {
          
                    Text("Name")
                    TextField("It is mandatory to fill", text: $name)
              
                VStack{
                    Divider()
                        .frame(
                            height: 1)
                        .overlay(.black)
                }
          
                    Text("Surname")
                    TextField("It is mandatory to fill", text: $surname)
                
                VStack{
                    Divider()
                        .frame(
                            height: 1)
                        .overlay(.black)
                }
            
                    Text("Date Of Birth")
                    TextField("It is mandatory to fill", text: $dateOfBirth)
                
                VStack{
                    Divider()
                        .frame(
                            height: 1)
                        .overlay(.black)
                }
                VStack(alignment:.leading) {
                    HStack {
                        Text(tcCitizenNo ? "Passport No" : "T.C ID No")
                        Spacer()
                        Text("T.C I am not a citizen")
                            .font(.caption)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .onTapGesture {
                                self.tcCitizenNo.toggle()
                                self.passportNo = ""
                                self.idNo = ""
                            }
                    }
                    TextField("It is mandatory to fill", text: tcCitizenNo  ? $passportNo : $idNo)
                    
                    tcCitizenNo ?
                    VStack(alignment:.leading){
                        Text("Nationality")
                        TextField("It is mandatory to fill", text: $surname)
                    }
                    : nil
                }
                
            }.padding(.top,15)
        }
       .padding(.horizontal)
            .padding([.top,.bottom],20)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
    
    private var paymentInfo : some View {
        VStack(alignment:.leading) {
            
            Text("Cart Number")
            TextField("xxxx xxxx xxxx xxxx", text: $mobilePhone)
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black.opacity(0.4))
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text("Expiration Date")
                    TextField("MM/YY", text: $expirationDate)
                }
                
                VStack(alignment:.leading){
                    Text("CVC2")
                    TextField("***", text: $expirationDate)
                }
            }
            
           
            
        }.padding(.horizontal)
            .padding([.top,.bottom],20)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
}
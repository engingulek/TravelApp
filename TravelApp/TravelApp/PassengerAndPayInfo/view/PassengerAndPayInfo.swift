//
//  PassengerAndPayInfo.swift
//  TravelApp
//
//  Created by engin gülek on 12.06.2023.
//

import SwiftUI




struct PassengerAndPayInfo: View {
    

    
    
    @EnvironmentObject var viewModel : PassengerAndPayInfoViewModel
    var passengerList = [String]()
    @State var selectedPassenger = 0
    
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
                        viewModel.payButtonAction()
                    }
                    .padding()
                    
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                    
                }
            }.padding(.top)
                .toolbar {
                    ToolbarItem(placement:.navigationBarLeading) {
                        Image(systemName: "arrowtriangle.backward")
                            .foregroundColor(Color.blue)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }.navigationBarBackButtonHidden(true)
            
            
        }.task {
            viewModel.getCountryJsonData()
        }
    }
    
}

struct PassengerAndPayInfo_Previews: PreviewProvider {
    static var previews: some View {
        PassengerAndPayInfo()
            .environmentObject(PassengerAndPayInfoViewModel())
    }
}


extension PassengerAndPayInfo {
    
    
    private var contactInfo : some View {
        VStack(alignment:.leading) {
            
            Text("Mobil Phone")
            HStack {
                Menu("\(viewModel.selectedCountryPhoneCode.code) \(viewModel.selectedCountryPhoneCode.dial_code)")
                {
                    ForEach(viewModel.countryPhoneCodeList,id: \.self) { item in
                        Button("\(item.name) \(item.dial_code)") {
                            viewModel.mobilePhone = ""
                            viewModel.selectedCountryPhoneCode = item
                            
                        }
                        
                    }
                    
                }
                
                TextField(viewModel.selectedCountryPhoneCode.defaultType, text: $viewModel.mobilePhone)
                    .keyboardType(.namePhonePad)
                    .onChange(of: viewModel.mobilePhone) { newValue in
                        
                        viewModel.mobilePhone = viewModel.infoFormatter(info: newValue, format: viewModel.selectedCountryPhoneCode.defaultType)
                    }
            }
            viewModel.phoneNumberEmmtyError ? Text(viewModel.phoneNumberErrorMessage).foregroundColor(.red)
                .font(.callout): nil
            
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black.opacity(0.4))
            }
            
            
            Text("E-Mail")
            TextField("Enter email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
            viewModel.errorEmail ? Text(viewModel.emailErrorMessage).foregroundColor(.red)  :  nil
            
            
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
                          ForEach(0..<passengerList.count,id:\.self) { index in
                              Text(passengerList[index])
                                  .font(.caption2)
                                  .padding(.horizontal,15)
                                  .padding(.vertical,10)
                                  .background(self.selectedPassenger == index ? .blue : .white)
                                  .foregroundColor(self.selectedPassenger == index ? .white : .blue)
                                  .border(.blue,width: 2)
                                  .cornerRadius(6)
                                 
                                  .onTapGesture {
                                      viewModel.controlPassengerInfo()
                                      if  viewModel.passengerInfoError == false {
                                          
                                          print(self.selectedPassenger)
                                          viewModel.passengerInfoList.append(
                                            PassengerInfo(index: selectedPassenger,
                                                          name:viewModel.name,
                                                          surname: viewModel.surname,
                                                          dateOfBirth: viewModel.dateOfBirth,
                                                          tcidNo: viewModel.idNo,
                                                          passengerType: passengerList[selectedPassenger]))
                                          viewModel.passengerInfoListWrite(index: index)
                                          self.selectedPassenger = index
                                      }
                                  }
                          }
                      }.padding(.horizontal)
                      
                  }.padding(.top,5)
                  VStack(alignment:.leading) {
                      
                      viewModel.passengerInfoError ?  Text(viewModel.passengerInfoErrorMessage).foregroundColor(.red)
                          .font(.callout): nil
                      
                      VStack(alignment:.leading) {
                          Text("Name")
                          TextField("It is mandatory to fill", text: $viewModel.name)
                        
                      }
                  
                      
                      VStack{
                          Divider()
                              .frame(
                                  height: 1)
                              .overlay(.black)
                      }
                      
                      Text("Surname")
                      TextField("It is mandatory to fill", text: $viewModel.surname)
                     
                      
                      VStack{
                          Divider()
                              .frame(
                                  height: 1)
                              .overlay(.black)
                      }
                      VStack(alignment:.leading) {
                          Text("Date Of Birth")
                          TextField("It is mandatory to fill - GG/AA/YYYY", text: $viewModel.dateOfBirth)
                              .onChange(of: viewModel.dateOfBirth) { newValue in
                                  viewModel.dateOfBirth = viewModel.infoFormatter(info: newValue, format: "XX/XX/XXXX")
                              }.keyboardType(.numberPad)
                         
                      }
                    
                      
                      VStack{
                          Divider()
                              .frame(
                                  height: 1)
                              .overlay(.black)
                      }
                      VStack(alignment:.leading) {
                          HStack {
                              Text( "T.C ID No")
                              Spacer()
                                
                          }
                          TextField("It is mandatory to fill", text: $viewModel.idNo.max(11))
                                                      
                       
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
            viewModel.cardInfoError ?  Text(viewModel.cardInfoErrorMessage).foregroundColor(.red)
                .font(.callout): nil
            Text("Card Number")
            TextField("xxxx xxxx xxxx xxxx", text: $viewModel.cardNo)
                .onChange(of: viewModel.cardNo) { newValue in
                    viewModel.cardNo = viewModel.infoFormatter(info: newValue, format: "XXXX XXXX XXXX XXXX")
                }
            VStack{
                Divider()
                    .frame(
                        height: 1)
                    .overlay(.black.opacity(0.4))
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text("Expiration Date")
                    TextField("MM/YY", text: $viewModel.expirationDate)
                        .onChange(of: viewModel.expirationDate) { newValue in
                            viewModel.expirationDate =  viewModel.infoFormatter(info: newValue, format: "XX/XX")
                        }
                }
                
                VStack(alignment:.leading){
                    Text("CVC2")
                    TextField("***", text: $viewModel.cvc2.max(3))
                }
            }
            
            
            
        }.padding(.horizontal)
            .padding([.top,.bottom],20)
        
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
    
}

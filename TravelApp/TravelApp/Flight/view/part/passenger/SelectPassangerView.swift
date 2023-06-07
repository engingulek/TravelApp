//
//  SelectPassangerView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI

struct SelectPassangerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var selectPassangerViewModel : SelectPassengerViewModel
    var body: some View {
        VStack {
            HStack{
                Text("Selecet Passanger")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.title2)
            }.padding(.horizontal)
                .onTapGesture {
                    self.dismiss()
                    selectPassangerViewModel.totalCountCalculate()
                }
         
                ScrollView{
                    VStack(alignment: .leading) {
                        ForEach(PassagersType.allCases,id: \.self) { passanger in
                            HStack {
                                VStack(alignment:.leading){
                                    Text(passanger.description.0)
                                        .font(.callout)
                                    Text(passanger.description.1)
                                        .font(.footnote)
                                }
                                Spacer()
                                
                               
                                
                                HStack{
                                    Button("-") {
                                        selectPassangerViewModel.toDecreasePassengerCount(passenger: passanger)
                                    }
                                    .padding(.horizontal,8)
                                    .padding(.vertical,3)
                                    .background(Color.gray.opacity(0.4))
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                                    Text("\(selectPassangerViewModel.passengerCount(passenger: passanger))")
                                        .frame(width: 10)
                                    Button("+") {
                                        selectPassangerViewModel.toIncreasePassengerCount(passenger: passanger)
                                    }
                                    
                                    .padding(.horizontal,8)
                                    .padding(.vertical,3)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                }
                                
                               
                                
                            }
                   
                                Divider()
                                .frame(height: 2)
                                .overlay(.blue)

                            
                            
                        }
                    }.padding(.horizontal)
                }
            
        }.padding(.top)
    }
    
   
   
    
    
}

struct SelectPassangerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPassangerView()
            .environmentObject(SelectPassengerViewModel())
    }
}

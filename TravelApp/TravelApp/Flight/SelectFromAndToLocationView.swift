//
//  SelectFromAndToLocationView.swift
//  TravelApp
//
//  Created by engin gülek on 2.06.2023.
//

import SwiftUI

struct SelectFromAndToLocationView: View {
     
    @Environment(\.dismiss) var dismiss
   @State var selectType = true
   @State private var text = ""
   
    var body: some View {
      
        VStack (alignment:.leading){
            
            VStack(spacing : 10) {
           
                Text(selectType  ?
                     "Select Departure Airport"
                     :
                    "Select Arrivel Airport"
                        
                )
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Text(selectType ?
                         "From" : "To")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title2)
                        .onTapGesture {
                            dismiss()
                        }
                }.padding(.horizontal)
                
                
                TextField("Enter City and Airport", text: $text)
                    .font(.callout)
                    .padding(.all,10)
                    .background(Color.white)
                    .foregroundColor(Color.gray)
                    .cornerRadius(10)
            }
            .padding()
            .background(Color.blue)
            VStack(alignment:.leading,spacing: 10) {
                Text("Populer Cities")
                    .fontWeight(.bold)
              
                HStack(spacing:15) {
                        ForEach(0...3,id:\.self) { i in
                            Text("Ankara")
                                .font(.callout)
                                .padding(.all,10)
                                .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray.opacity(0.7), lineWidth: 1))
                        }
                    }
                
                  HStack(spacing:15) {
                          ForEach(0...2,id:\.self) { i in
                              Text("Londra")
                                  .font(.callout)
                                  .padding(.all,10)
                                  .overlay( /// apply a rounded border
                                  RoundedRectangle(cornerRadius: 10)
                                      .stroke(.gray.opacity(0.7), lineWidth: 1))
                          }
                      }
                .padding(.top,2)
            }.padding(.horizontal)
            Spacer()

        }.task {
            print(selectType)
        }

    }
}


struct SelectFromAndToLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectFromAndToLocationView(selectType: true)
    }
}




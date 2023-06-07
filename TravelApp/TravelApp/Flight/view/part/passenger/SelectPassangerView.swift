//
//  SelectPassangerView.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import SwiftUI



enum PassagersType: CaseIterable {
    case adult
    case kind
    case baby
    case student
    
    var description : (String,String) {
        switch self {
        case .adult:
            return ("Adult","")
            
        case .kind:
            return ("Kind","(2-12) Years Old")
    
        case .baby:
            return ("Baby","(0-2) Years Old")
        case .student:
            return ("Student","12-24 Years Old")
        }
    }
}

struct SelectPassangerView: View {
    
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
                                        
                                    }
                                    .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                    .background(.gray.opacity(0.3))
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    
                                    Text("1")
                                    
                                    Button("+") {
                                        
                                    }
                                    .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                    .background(.blue)
                                    .cornerRadius(20)
                                    .foregroundColor(.white)
                                }
                            }
                            Divider()
                        }
                    }.padding(.horizontal)
                }
            
        }
    }
    
   
   
    
    
}

struct SelectPassangerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPassangerView()
    }
}

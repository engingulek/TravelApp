//
//  SelectPasangerViewModel.swift
//  TravelApp
//
//  Created by engin gülek on 7.06.2023.
//

import Foundation


enum PassagersType: CaseIterable,Hashable {
    case adult
    case kind
    case baby
    case student
    
    var description  : (String,String,Int) {
        switch self {
        case .adult:
            return ("Adult","",1)
            
       case .kind:
            return ("Kind","(2-12) Years Old",0)
    
        case .baby:
            return ("Baby","(0-2) Years Old",0)
        case .student:
            return ("Student","12-24 Years Old",0)
        }
    }
}

class SelectPassengerViewModel : ObservableObject {
    @Published var adultCount = PassagersType.adult.description.2
    @Published var kindCount = PassagersType.kind.description.2
    @Published var babyCount = PassagersType.baby.description.2
    @Published var studentCount = PassagersType.student.description.2
    @Published var totalCount = 1
    
    
    
    func passengerCount(passenger:PassagersType) -> Int{
        switch passenger {
            
        case .adult:
            return adultCount
        case .kind:
            return kindCount
        case .baby:
            return babyCount
        case .student:
            return studentCount
        }
    }
    
    func toIncreasePassengerCount(passenger:PassagersType){
        switch passenger {
            
        case .adult:
            self.adultCount += 1
            print(adultCount)
        case .kind:
            self.kindCount += 1
            print(kindCount)
        case .baby:
            self.babyCount += 1
            print(babyCount)
        case .student:
            self.studentCount += 1
            print(studentCount)
        }
    }
    
    func toDecreasePassengerCount(passenger:PassagersType){
        switch passenger {
            
        case .adult:
            if self.adultCount > 1 {
                self.adultCount -= 1
                print(adultCount)
            }
           
        case .kind:
            if self.kindCount > 0 {
                self.kindCount -= 1
                print(kindCount)
            }
           
        case .baby:
            if self.babyCount > 0 {
                self.babyCount -= 1
                print(babyCount)
            }
           
        case .student:
            if self.studentCount > 0 {
                self.studentCount -= 1
                print(studentCount)
            }
        }
    }
    
    func totalCountCalculate(){
        totalCount = self.adultCount + self.kindCount + self.babyCount + self.studentCount
    }
    
    
}
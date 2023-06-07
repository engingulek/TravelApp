# TravelApp
Flight, Bus and Car Rent app

Last Update



// Passanger Enum

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



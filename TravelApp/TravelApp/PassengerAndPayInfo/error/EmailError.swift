//
//  EmailError.swift
//  TravelApp
//
//  Created by engin gülek on 16.06.2023.
//

import Foundation

enum EmailError : LocalizedError {
    case EmptyEmail
    case EmailFormaterError
    
    var errorDescription: String?{
        switch self {
        case .EmptyEmail:
            return "This field is required"
        case .EmailFormaterError:
            return "Email format is wrong"
        }
    }
}

extension PassengerAndPayInfoViewModel {
    // Leaving the email field blank
    func emptyEmailError() throws {
        guard email.count != 0 else {throw EmailError.EmptyEmail }
    }
    
    // Email format is wrong
    func formaterEmailError() throws {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = email.range(
            of: emailPattern,
            options: .regularExpression
        )
        guard result != nil else {throw EmailError.EmailFormaterError}
    }
    
    internal  func controlEmail() {
          // MARK: - Email Error
          do{
              try emptyEmailError()
              try formaterEmailError()
              self.errorEmail = false
          }catch{
              self.errorEmail = true
              self.emailErrorMessage = error.localizedDescription
          }
      }
}

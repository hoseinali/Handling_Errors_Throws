
// Handling Errors

import UIKit

enum ErrorCheckMobileNumber {
    case inavalidNumber
    case invalidPerfix
    case invalidCount
}

class MobileNumber {
    
    func callNumber(_ number: String) {
        let error = isNumberValid(number)
        if error == .invalidPerfix {
            
        } else if error == .inavalidNumber {
            
        } else if error == .invalidCount {
            
        }
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    private func isNumberValid(_ number: String) -> ErrorCheckMobileNumber? {
        if number.count != 10 {
            return .invalidCount
        } else if !number.hasPrefix("09") {
            return .invalidPerfix
        } else if Int(number) == nil {
            return .inavalidNumber
        }
        return nil
    }
}

// Now we use error handling with throw

enum NewErrorCheckMobileNumber: Error {
    case inavalidNumber
    case invalidPerfix
    case invalidCount
}

class NewMobileNumber {
    
    func callNumber(_ number: String) {
        do {
            
           try isNumberValid(number)
            
        } catch NewErrorCheckMobileNumber.invalidCount {
            
        } catch NewErrorCheckMobileNumber.invalidPerfix {
            
        } catch NewErrorCheckMobileNumber.inavalidNumber {
            
        } catch {
            
        }
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    private func isNumberValid(_ number: String) throws {
        if number.count != 10 {
            throw NewErrorCheckMobileNumber.invalidCount
        } else if !number.hasPrefix("09") {
            throw NewErrorCheckMobileNumber.invalidPerfix
        } else if Int(number) == nil {
            throw NewErrorCheckMobileNumber.inavalidNumber
        }
    }
}

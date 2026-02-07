//
//  HoroscopeError.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import Foundation

enum HoroscopeError: LocalizedError {
    case invalidURL(endPoint: String)
    case serverError(description: String, code: Int)
    case jsonEncodingError
    case nsError(description: String, code: Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let endPoint):
            return "Cannot form url for endpoint: \(endPoint)"
        case .serverError(let description, _):
            return description
        case .jsonEncodingError:
            return "json encoding error"
        case.nsError(let description, _):
            return description
        }
    }
    
    var code: Int {
           switch self {
           case .invalidURL(_):
               return 400
               
           case .serverError(_, let code):
               return code
               
           case .jsonEncodingError:
               return 1202
           case .nsError(_, let code):
               return code
           }
       }
}

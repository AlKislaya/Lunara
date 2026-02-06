//
//  Optionals+ext.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}

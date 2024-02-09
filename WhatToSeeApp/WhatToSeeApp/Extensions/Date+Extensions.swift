//
//  Date+Extensions.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 08/02/24.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}

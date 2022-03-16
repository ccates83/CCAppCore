//
//  Date+Format.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import Foundation

extension Date {
    
    private func longFormat() -> String {
        return "\(self.monthAsString()) \(self.dayAsString()), \(self.yearAsString())"
    }
    
    func monthAsString() -> String {
        let df = DateFormatter()
        df.dateFormat = "MMMM"
        return df.string(from: self)
    }
    
    func dayAsString() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd"
        return df.string(from: self)
    }
    
    func yearAsString() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy"
        return df.string(from: self)
    }
    
}

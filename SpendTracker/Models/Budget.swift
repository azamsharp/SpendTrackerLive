//
//  Budget.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 1/13/24.
//

import Foundation
import SwiftData

// Budget can be "Vacation", "Groceries", "Entertainment"
@Model
class Budget {
    let name: String
    let limit: Double
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
}

//
//  ContentView.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 1/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var budgetName: String = ""
    @State private var budgetLimit: Double?
    
    // @Query is only available inside a View
    @Query private var budgets: [Budget] = []
    
    private var isFormValid: Bool {
        !budgetName.isEmpty && budgetLimit != nil
    }
    
    var body: some View {
        Form {
            Section("Add Budget") {
                TextField("Enter name", text: $budgetName)
                TextField("Enter limit", value: $budgetLimit, format: .number)
                Button("Save") {
                    // save the budget to the database
                    let budget = Budget(name: budgetName, limit: budgetLimit ?? 0.0)
                    context.insert(budget)
                }.disabled(!isFormValid)
            }
            
            Section("All Budgets") {
                List(budgets) { budget in
                    HStack {
                        Text(budget.name)
                        Spacer()
                        Text(budget.limit, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Budget.self, inMemory: true)
}

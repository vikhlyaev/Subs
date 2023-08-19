//
//  SubscribeCellViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

struct SubscribeCellViewModel {
    
    // MARK: - Formatters
    
    static private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }()
    
    static private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "d MMMM yyyy"
        return formatter
    }()
    
    // MARK: - Properties
    
    let title: String
    let cost: String
    let nextPayment: String
    let reminder: String
    
    // MARK: - Life Cycle
    
    init(title: String, cost: String, nextPayment: String, reminder: String) {
        self.title = title
        self.cost = cost
        self.nextPayment = nextPayment
        self.reminder = reminder
    }
    
    init(subscribe: Subscribe) {
        self.title = subscribe.title
        self.cost = SubscribeCellViewModel.currencyFormatter.string(from: subscribe.cost as NSNumber) ?? ""
        self.nextPayment = SubscribeCellViewModel.dateFormatter.string(from: subscribe.nextPayment)
        self.reminder = subscribe.reminder.title
    }
}

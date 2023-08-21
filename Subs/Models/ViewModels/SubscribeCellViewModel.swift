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
    let price: String
    let nextBillingDate: String
    let alert: String
    
    // MARK: - Life Cycle
    
    init(title: String, price: String, nextBillingDate: String, alert: String) {
        self.title = title
        self.price = price
        self.nextBillingDate = nextBillingDate
        self.alert = alert
    }
    
    init(subscribe: Subscribe) {
        self.title = subscribe.title
        self.price = SubscribeCellViewModel.currencyFormatter.string(from: subscribe.price as NSNumber) ?? ""
        self.nextBillingDate = SubscribeCellViewModel.dateFormatter.string(from: subscribe.nextBillingDate)
        self.alert = subscribe.alert.title
    }
}

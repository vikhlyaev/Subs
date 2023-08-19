//
//  SubscribeCellViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

struct SubscribeCellViewModel {
    
    static private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }()
    
    static func convert(subscribe: Subscribe) -> SubscribeCellViewModel {
        SubscribeCellViewModel(
            title: subscribe.title,
            cost: formatter.string(from: subscribe.cost as NSNumber) ?? "",
            nextPayment: "завтра",
            reminder: "за 3 дня"
        )
    }
    
    let title: String
    let cost: String
    let nextPayment: String
    let reminder: String
}

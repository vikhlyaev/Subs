//
//  Subscribe.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

struct Subscribe {
    let title: String
    let price: Double
    let nextBillingDate: Date
    let billingCycle: BillingCycle
    let alert: Alert
}

typealias Subscribes = [Subscribe]

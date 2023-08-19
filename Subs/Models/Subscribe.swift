//
//  Subscribe.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

struct Subscribe {
    let title: String
    let cost: Double
    let nextPayment: Date
    let frequency: Frequency
    let reminder: Reminder
}

typealias Subscribes = [Subscribe]

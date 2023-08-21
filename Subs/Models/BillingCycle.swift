//
//  Frequence.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

enum BillingCycle: CaseIterable {
    case weekly
    case monthly
    case yearly
    
    var title: String {
        switch self {
        case .weekly:
            return Localization.billingCycleWeekly
        case .monthly:
            return Localization.billingCycleMonthly
        case .yearly:
            return Localization.billingCycleYearly
        }
    }
}

//
//  Parameters.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import Foundation

enum Parameters: CaseIterable {
    case title
    case price
    case nextBillingDate
    case billingCycle
    case alert
    
    var title: String {
        switch self {
        case .title:
            return Localization.parametersTitleText
        case .price:
            return Localization.parametersPriceText
        case .nextBillingDate:
            return Localization.parametersNextBillingDateText
        case .billingCycle:
            return Localization.parametersBillingCycleText
        case .alert:
            return Localization.parametersAlertText
        }
    }
}

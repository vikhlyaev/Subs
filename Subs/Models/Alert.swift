//
//  Alert.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

enum Alert: CaseIterable {
    case dayOfPayment
    case oneDay
    case threeDay
    case oneWeek
    case twoWeek
    case none
    
    var title: String {
        switch self {
        case .dayOfPayment:
            return Localization.alertDayOfPayment
        case .oneDay:
            return Localization.alertOneDay
        case .threeDay:
            return Localization.alertThreeDay
        case .oneWeek:
            return Localization.alertOneWeek
        case .twoWeek:
            return Localization.alertTwoWeek
        case .none:
            return Localization.alertNone
        }
    }
}

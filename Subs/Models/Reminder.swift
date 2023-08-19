//
//  Reminder.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

enum Reminder: CaseIterable {
    case dayOfPayment
    case oneDay
    case threeDay
    case oneWeek
    case twoWeek
    case none
    
    var title: String {
        switch self {
        case .dayOfPayment:
            return Localization.reminderDayOfPayment
        case .oneDay:
            return Localization.reminderOneDay
        case .threeDay:
            return Localization.reminderThreeDay
        case .oneWeek:
            return Localization.reminderOneWeek
        case .twoWeek:
            return Localization.reminderTwoWeek
        case .none:
            return Localization.reminderNone
        }
    }
}

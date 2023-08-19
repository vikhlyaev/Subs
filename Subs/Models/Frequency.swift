//
//  Frequence.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

enum Frequency: CaseIterable {
    case oncePerWeek
    case oncePerMonth
    case oncePerYear
    
    var title: String {
        switch self {
        case .oncePerWeek:
            return Localization.frequencyOncePerWeek
        case .oncePerMonth:
            return Localization.frequencyOncePerMonth
        case .oncePerYear:
            return Localization.frequencyOncePerYear
        }
    }
}

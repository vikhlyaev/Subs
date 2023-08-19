//
//  MySubscribesViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol MySubscribesOutput {
    var subscribes: Subscribes { get }
    func viewIsReady()
}

final class MySubscribesViewModel {
    
}

// MARK: - MySubscribesOutput

extension MySubscribesViewModel: MySubscribesOutput {
    var subscribes: Subscribes {
        [
            Subscribe(
                title: "Яндекс Плюс",
                cost: 199,
                nextPayment: Date(),
                frequency: .oncePerMonth,
                reminder: .oneDay
            ),
            Subscribe(
                title: "Apple Music",
                cost: 169,
                nextPayment: Date(),
                frequency: .oncePerMonth,
                reminder: .oneWeek
            ),
            Subscribe(
                title: "Иви",
                cost: 3469,
                nextPayment: Date(),
                frequency: .oncePerYear,
                reminder: .twoWeek
            )
        ]
    }
    
    func viewIsReady() {
        print(#function)
    }
}

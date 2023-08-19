//
//  MySubscribesViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol MySubscribesOutput {
    func viewIsReady()
    func numberOfRowsInSection() -> Int
    func viewModelForRow(at indexPath: IndexPath) -> SubscribeCellViewModel
}

final class MySubscribesViewModel {
    
    private var subscribes: Subscribes = [
        Subscribe(title: "Яндекс Плюс", cost: 199, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneDay),
        Subscribe(title: "Apple Music", cost: 169, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneWeek),
        Subscribe(title: "Иви", cost: 3469, nextPayment: Date(), frequency: .oncePerYear, reminder: .twoWeek),
        Subscribe(title: "Яндекс Плюс", cost: 199, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneDay),
        Subscribe(title: "Apple Music", cost: 169, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneWeek),
        Subscribe(title: "Иви", cost: 3469, nextPayment: Date(), frequency: .oncePerYear, reminder: .twoWeek),
        Subscribe(title: "Яндекс Плюс", cost: 199, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneDay),
        Subscribe(title: "Apple Music", cost: 169, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneWeek),
        Subscribe(title: "Иви", cost: 3469, nextPayment: Date(), frequency: .oncePerYear, reminder: .twoWeek),
        Subscribe(title: "Яндекс Плюс", cost: 199, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneDay),
        Subscribe(title: "Apple Music", cost: 169, nextPayment: Date(), frequency: .oncePerMonth, reminder: .oneWeek),
        Subscribe(title: "Иви", cost: 3469, nextPayment: Date(), frequency: .oncePerYear, reminder: .twoWeek)
    ]
    
}

// MARK: - MySubscribesOutput

extension MySubscribesViewModel: MySubscribesOutput {
    func viewIsReady() {
        print(#function)
    }
    
    func numberOfRowsInSection() -> Int {
        subscribes.count
    }
    
    func viewModelForRow(at indexPath: IndexPath) -> SubscribeCellViewModel {
        SubscribeCellViewModel(subscribe: subscribes[indexPath.row])
    }
}

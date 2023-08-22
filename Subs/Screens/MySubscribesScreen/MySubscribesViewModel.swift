//
//  MySubscribesViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol MySubscribesOutput {
    func viewIsReady()
    func numberOfRows() -> Int
    func viewModelForRow(at indexPath: IndexPath) -> SubscribeCellViewModel
    func viewModelForNewSubscribe() -> NewSubscribeViewModel
}

final class MySubscribesViewModel {
    
    // MARK: - Properties
    
    private var subscribes: Subscribes = [
        Subscribe(title: "Яндекс Плюс", price: 199, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneDay),
        Subscribe(title: "Apple Music", price: 169, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneWeek),
        Subscribe(title: "Иви", price: 3469, nextBillingDate: Date(), billingCycle: .yearly, alert: .twoWeek),
        Subscribe(title: "Яндекс Плюс", price: 199, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneDay),
        Subscribe(title: "Apple Music", price: 169, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneWeek),
        Subscribe(title: "Иви", price: 3469, nextBillingDate: Date(), billingCycle: .yearly, alert: .twoWeek),
        Subscribe(title: "Яндекс Плюс", price: 199, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneDay),
        Subscribe(title: "Apple Music", price: 169, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneWeek),
        Subscribe(title: "Иви", price: 3469, nextBillingDate: Date(), billingCycle: .yearly, alert: .twoWeek),
        Subscribe(title: "Яндекс Плюс", price: 199, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneDay),
        Subscribe(title: "Apple Music", price: 169, nextBillingDate: Date(), billingCycle: .monthly, alert: .oneWeek),
        Subscribe(title: "Иви", price: 3469, nextBillingDate: Date(), billingCycle: .yearly, alert: .twoWeek)
    ]
    
    private let screenBuilder: ScreenBuilder
    
    // MARK: - Life Cycle
    
    init(screenBuilder: ScreenBuilder) {
        self.screenBuilder = screenBuilder
    }
}

// MARK: - MySubscribesOutput

extension MySubscribesViewModel: MySubscribesOutput {
    func viewIsReady() {
        print(#function)
    }
    
    func numberOfRows() -> Int {
        subscribes.count
    }
    
    func viewModelForRow(at indexPath: IndexPath) -> SubscribeCellViewModel {
        SubscribeCellViewModel(subscribe: subscribes[indexPath.row])
    }
    
    func viewModelForNewSubscribe() -> NewSubscribeViewModel {
        NewSubscribeViewModel()
    }
}

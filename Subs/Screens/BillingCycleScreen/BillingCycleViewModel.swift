//
//  BillingCycleViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import Foundation

protocol BillingCycleOutput {
    func viewIsReady()
    func numberOfRows() -> Int
    func titleForRow(at indexPath: IndexPath) -> String
    func didSelectRow(at indexPath: IndexPath)
}

final class BillingCycleViewModel: BillingCycleOutput {
    func viewIsReady() {
        print(#function)
    }
    
    func numberOfRows() -> Int {
        BillingCycle.allCases.count
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        BillingCycle.allCases[indexPath.row].title
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        print(indexPath)
    }
}

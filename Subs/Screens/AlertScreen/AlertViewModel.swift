//
//  AlertViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import Foundation

protocol AlertOutput {
    func viewIsReady()
    func numberOfRows() -> Int
    func titleForRow(at indexPath: IndexPath) -> String
    func didSelectRow(at indexPath: IndexPath)
}

final class AlertViewModel: AlertOutput {
    func viewIsReady() {
        print(#function)
    }
    
    func numberOfRows() -> Int {
        Alert.allCases.count
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        Alert.allCases[indexPath.row].title
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        print(indexPath)
    }
}

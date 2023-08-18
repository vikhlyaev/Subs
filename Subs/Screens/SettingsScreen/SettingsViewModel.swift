//
//  SettingsViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol SettingsOutput {
    func viewIsReady()
}

final class SettingsViewModel {
    
}

// MARK: - SettingsOutput

extension SettingsViewModel: SettingsOutput {
    func viewIsReady() {
        print(#function)
    }
}

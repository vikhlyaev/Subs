//
//  NewSubscribeViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol NewSubscribeOutput {
    func viewIsReady()
}

final class NewSubscribeViewModel {
    
}

// MARK: - NewSubscribeOutput

extension NewSubscribeViewModel: NewSubscribeOutput {
    func viewIsReady() {
        print(#function)
    }
}

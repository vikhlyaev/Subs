//
//  MySubscribesViewModel.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import Foundation

protocol MySubscribesOutput {
    func viewIsReady()
}

final class MySubscribesViewModel {
    
}

// MARK: - MySubscribesOutput

extension MySubscribesViewModel: MySubscribesOutput {
    func viewIsReady() {
        print(#function)
    }
}

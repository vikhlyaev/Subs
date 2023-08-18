//
//  ScreenBuilder.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

protocol ScreenBuilder {
    func createMySubscribesScreen() -> UIViewController
    func createSettingsScreen() -> UIViewController
    func createNewSubscribeScreen() -> UIViewController
}

final class ScreenBuilderImpl: ScreenBuilder {
    func createMySubscribesScreen() -> UIViewController {
        let viewModel = MySubscribesViewModel()
        let vc = MySubscribesViewController(viewModel: viewModel)
        return vc
    }
    
    func createSettingsScreen() -> UIViewController {
        let viewModel = SettingsViewModel()
        let vc = SettingsViewController(viewModel: viewModel)
        return vc
    }
    
    func createNewSubscribeScreen() -> UIViewController {
        let viewModel = NewSubscribeViewModel()
        let vc = NewSubscribeViewController(viewModel: viewModel)
        return vc
    }
}

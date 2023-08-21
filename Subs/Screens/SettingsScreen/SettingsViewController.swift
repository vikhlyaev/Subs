//
//  SettingsViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: SettingsOutput
    
    // MARK: - Life Cycle
    
    init(viewModel: SettingsOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupView()
        viewModel.viewIsReady()
    }
    
    // MARK: - Setup UI
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
}

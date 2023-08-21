//
//  NewSubscribeViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class NewSubscribeViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let titleText = Localization.newSubscribeTitleText
        static let cancelBarButtonText = Localization.newSubscribeCancelBarButtonText
        static let saveBarButtonText = Localization.newSubscribeSaveBarButtonText
    }
    
    // MARK: - Properties
    
    private let viewModel: NewSubscribeOutput
    
    // MARK: - Life Cycle
    
    init(viewModel: NewSubscribeOutput) {
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
        let cancelBarButton = UIBarButtonItem(
            title: Constants.cancelBarButtonText,
            style: .plain,
            target: self,
            action: #selector(cancelBarButtonTapped)
        )
        
        let saveBarButton = UIBarButtonItem(
            title: Constants.saveBarButtonText,
            style: .done,
            target: self,
            action: #selector(saveBarButtonTapped)
        )
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
        navigationItem.title = Constants.titleText
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Actions
    
    @objc
    private func cancelBarButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc
    private func saveBarButtonTapped() {
        print(#function)
    }
}

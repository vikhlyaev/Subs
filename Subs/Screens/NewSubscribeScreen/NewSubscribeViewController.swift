//
//  NewSubscribeViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class NewSubscribeViewController: UITableViewController {
    
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
        super.init(style: .insetGrouped)
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
        tableView.register(ParameterCell.self)
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
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Parameters.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ParameterCell = tableView.dequeueReusableCell()
        cell.configure(with: Parameters.allCases[indexPath.row])
        cell.delegate = self
        return cell
    }
}

// MARK: - ParameterCellDelegate

extension NewSubscribeViewController: ParameterCellDelegate {
    func didTapAlertButton() {
        let viewModel = AlertViewModel()
        let vc = AlertViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        present(navigationController, animated: true)
    }
    
    func didTapBillingCycleButton() {
        let viewModel = BillingCycleViewModel()
        let vc = BillingCycleViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        present(navigationController, animated: true)
    }
}

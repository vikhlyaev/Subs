//
//  BillingCycleViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import UIKit

final class BillingCycleViewController: UITableViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let titleText = Localization.billingCycleTitleText
        static let cancelBarButtonText = Localization.alertCancelBarButtonText
    }
    
    // MARK: - Properties
    
    private let viewModel: BillingCycleOutput
    
    // MARK: - Life Cycle
    
    init(viewModel: BillingCycleOutput) {
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
        
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.title = Constants.titleText
    }
    
    private func setupView() {
        tableView.register(AlertCell.self)
    }
    
    // MARK: - Actions
    
    @objc
    private func cancelBarButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlertCell = tableView.dequeueReusableCell()
        cell.configure(with: viewModel.titleForRow(at: indexPath))
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlertCell else { return }
        cell.setSelected(true, animated: true)
        cell.accessoryType = .checkmark
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        viewModel.didSelectRow(at: selectedIndexPath)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlertCell else { return }
        cell.setSelected(false, animated: true)
        cell.accessoryType = .none
    }
}

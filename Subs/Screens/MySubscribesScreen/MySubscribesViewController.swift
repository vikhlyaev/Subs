//
//  MySubscribesViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class MySubscribesViewController: UITableViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let sortBarButtonText = Localization.mySubscribesSortBarButtonText
        static let addBarButtonText = Localization.mySubscribesAddBarButtonText
        static let searchPlaceholderText = Localization.mySubscribesSearchPlaceholderText
    }
    
    // MARK: - Properties
    
    private let viewModel: MySubscribesOutput
    
    // MARK: - Life Cycle
    
    init(viewModel: MySubscribesOutput) {
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
        let sortBarButton = UIBarButtonItem(
            title: Constants.sortBarButtonText,
            style: .plain,
            target: self,
            action: #selector(sortBarButtonTapped)
        )
        
        let addBarButton = UIBarButtonItem(
            title: Constants.addBarButtonText,
            style: .done,
            target: self,
            action: #selector(addBarButtonTapped)
        )
        
        let searchController: UISearchController = {
            let searchController = UISearchController()
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.searchBar.placeholder = Constants.searchPlaceholderText
            searchController.searchBar.delegate = self
            return searchController
        }()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = sortBarButton
        navigationItem.rightBarButtonItem = addBarButton
        navigationItem.searchController = searchController
    }
    
    private func setupView() {
        tableView.register(SubscribeCell.self)
    }
    
    // MARK: - Actions
    
    @objc
    private func sortBarButtonTapped() {
        print(#function)
    }
    
    @objc
    private func addBarButtonTapped() {
        let viewModel = self.viewModel.viewModelForNewSubscribe()
        let vc = NewSubscribeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        present(navigationController, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SubscribeCell = tableView.dequeueReusableCell()
        cell.configure(with: viewModel.viewModelForRow(at: indexPath))
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
        }
    }
}

// MARK: - UISearchBarDelegate

extension MySubscribesViewController: UISearchBarDelegate {
    
}

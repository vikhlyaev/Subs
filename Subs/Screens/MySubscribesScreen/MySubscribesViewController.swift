//
//  MySubscribesViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class MySubscribesViewController: UIViewController {
    
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
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MySubscribesView(subscribes: viewModel.subscribes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        viewModel.viewIsReady()
    }
    
    // MARK: - UI
    
    private func setupNavigationController() {
        let sortBarButton = UIBarButtonItem(
            title: Constants.sortBarButtonText,
            style: .plain,
            target: self,
            action: #selector(sortBarButtonTapped)
        )
        
        let addBarButton = UIBarButtonItem(
            title: Constants.addBarButtonText,
            style: .plain,
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
    
    // MARK: - Actions
    
    @objc
    private func sortBarButtonTapped() {
        print(#function)
    }
    
    @objc
    private func addBarButtonTapped() {
        print(#function)
    }
}

extension MySubscribesViewController: UISearchBarDelegate {
    
}

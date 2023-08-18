//
//  NewSubscribeViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class NewSubscribeViewController: UIViewController {
    
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
    
    override func loadView() {
        view = NewSubscribeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewIsReady()
    }
}

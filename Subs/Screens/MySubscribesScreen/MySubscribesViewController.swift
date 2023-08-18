//
//  MySubscribesViewController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit

final class MySubscribesViewController: UIViewController {
    
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
        view = MySubscribesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewIsReady()
    }
}

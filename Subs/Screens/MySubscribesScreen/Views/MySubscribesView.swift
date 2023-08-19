//
//  MySubscribesView.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit
import SnapKit

final class MySubscribesView: UIView {
    
    // MARK: - UI
    
    private let tableView: MySubscribesTableView
    
    // MARK: - Life Cycle
    
    init(subscribes: [Subscribe]) {
        tableView = MySubscribesTableView(subscribes: subscribes)
        super.init(frame: .zero)
        setupView()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupView() {
        backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

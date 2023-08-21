//
//  AlertCell.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import UIKit
import SnapKit

final class AlertCell: UITableViewCell, ReuseIdentifying {
    
    // MARK: - Constants
    
    private enum Constants {
        static let paddingXConstraintsConst: CGFloat = 16
        static let paddingYConstraintsConst: CGFloat = 16
    }
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(Constants.paddingXConstraintsConst)
            make.top.bottom.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
        }
    }
    
    // MARK: - Configure
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

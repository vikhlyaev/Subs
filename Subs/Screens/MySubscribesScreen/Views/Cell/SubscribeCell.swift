//
//  SubscribeCell.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 18.08.2023.
//

import UIKit
import SnapKit

final class SubscribeCell: UITableViewCell, ReuseIdentifying {
    
    // MARK: - Constants
    
    private enum Constants {
        static let paymentLabelText = Localization.subscribeCellPaymentLabelText
        static let reminderLabelText = Localization.subscribeCellReminderLabelText
        static let paymentIconImage = UIImage(systemName: "clock")
        static let reminderIconImage = UIImage(systemName: "bell")
        static let paddingYConstraintsConst: CGFloat = 20
        static let paddingXConstraintsConst: CGFloat = 16
        static let spacingYConstraintsConst: CGFloat = 2
        static let spacingXConstraintsConst: CGFloat = 8
    }
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular17
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.font = .medium17
        return label
    }()
    
    private lazy var paymentImageView: UIImageView = {
        let imageView = UIImageView()
        var configuration = UIImage.SymbolConfiguration(paletteColors: [.systemGray])
        configuration = configuration.applying(UIImage.SymbolConfiguration(pointSize: 13))
        imageView.image = Constants.paymentIconImage?.withConfiguration(configuration)
        return imageView
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.font = .regular15
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var reminderImageView: UIImageView = {
        let imageView = UIImageView()
        var configuration = UIImage.SymbolConfiguration(paletteColors: [.systemGray])
        configuration = configuration.applying(UIImage.SymbolConfiguration(pointSize: 13))
        imageView.image = Constants.reminderIconImage?.withConfiguration(configuration)
        return imageView
    }()
    
    private lazy var reminderLabel: UILabel = {
        let label = UILabel()
        label.font = .regular15
        label.textColor = .systemGray
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
    
    private func setupView() {
        separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        contentView.addSubview(titleLabel)
        contentView.addSubview(costLabel)
        contentView.addSubview(paymentImageView)
        contentView.addSubview(paymentLabel)
        contentView.addSubview(reminderImageView)
        contentView.addSubview(reminderLabel)
        setConstraints()
    }
    
    // MARK: - Configure
    
    func configure(with model: SubscribeCellViewModel) {
        titleLabel.text = model.title
        costLabel.text = model.cost
        paymentLabel.text = [Constants.paymentLabelText, model.nextPayment].joined(separator: "・")
        reminderLabel.text = [Constants.reminderLabelText, model.reminder].joined(separator: "・")
    }
}

// MARK: - Setting Constraints

extension SubscribeCell {
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(Constants.paddingXConstraintsConst)
            make.leading.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
            make.trailing.equalTo(costLabel.snp.leading).inset(-Constants.paddingYConstraintsConst)
        }
        
        costLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
        }
        
        paymentImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
            make.centerY.equalTo(paymentLabel)
        }
        
        paymentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-Constants.spacingXConstraintsConst)
            make.leading.equalTo(paymentImageView.snp.trailing).inset(-Constants.spacingYConstraintsConst)
        }
        
        reminderImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
            make.centerY.equalTo(reminderLabel)
        }
        
        reminderLabel.snp.makeConstraints { make in
            make.top.equalTo(paymentLabel.snp.bottom).inset(-Constants.spacingYConstraintsConst)
            make.leading.equalTo(reminderImageView.snp.trailing).inset(-Constants.spacingYConstraintsConst)
            make.bottom.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
        }
    }
}

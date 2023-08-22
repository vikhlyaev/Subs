//
//  ParameterCell.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 21.08.2023.
//

import UIKit
import SnapKit

protocol ParameterCellDelegate: AnyObject {
    func didTapAlertButton()
    func didTapBillingCycleButton()
}

final class ParameterCell: UITableViewCell, ReuseIdentifying {
    
    // MARK: - Constants
    
    private enum Constants {
        static let paddingXConstraintsConst: CGFloat = 16
        static let paddingYConstraintsConst: CGFloat = 16
        static let defaultAlertButtonText = Localization.alertThreeDay
        static let defaultBillingCycleButtonText = Localization.billingCycleMonthly
        static let titleTextFieldPlaceholderText = "Apple Music"
        static let priceTextFieldPlaceholderInt = 169
    }
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        return textField
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .regular17
        button.setTitle(Constants.defaultAlertButtonText, for: .normal)
        button.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var billingCycleButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .regular17
        button.setTitle(Constants.defaultBillingCycleButtonText, for: .normal)
        button.addTarget(self, action: #selector(billingCycleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }()
    
    // MARK: - Properties
    
    weak var delegate: ParameterCellDelegate?
    
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
        selectionStyle = .none
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(Constants.paddingXConstraintsConst)
            make.top.bottom.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
        }
    }
    
    private func addTextField(for type: Parameters) {
        if case .price = type {
            textField.keyboardType = .decimalPad
            let costString = currencyFormatter.string(from: Constants.priceTextFieldPlaceholderInt as NSNumber) ?? ""
            textField.placeholder = costString
        }
        if case .title = type {
            textField.keyboardType = .default
            textField.placeholder = Constants.titleTextFieldPlaceholderText
        }
        
        titleLabel.snp.contentHuggingHorizontalPriority = 251
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).inset(-Constants.paddingXConstraintsConst)
            make.trailing.equalTo(contentView.snp.trailing).inset(Constants.paddingXConstraintsConst)
            make.top.bottom.equalTo(contentView).inset(Constants.paddingYConstraintsConst)
        }
    }
    
    private func addDatePicker() {
        contentView.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).inset(-Constants.paddingXConstraintsConst)
            make.trailing.equalTo(contentView.snp.trailing).inset(Constants.paddingXConstraintsConst)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    private func addBillingCycleButton() {
        contentView.addSubview(billingCycleButton)
        billingCycleButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).inset(-Constants.paddingXConstraintsConst)
            make.trailing.equalTo(contentView.snp.trailing).inset(Constants.paddingXConstraintsConst)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    private func addAlertButton() {
        contentView.addSubview(alertButton)
        alertButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).inset(-Constants.paddingXConstraintsConst)
            make.trailing.equalTo(contentView.snp.trailing).inset(Constants.paddingXConstraintsConst)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func alertButtonTapped() {
        delegate?.didTapAlertButton()
    }
    
    @objc
    private func billingCycleButtonTapped() {
        delegate?.didTapBillingCycleButton()
    }
    
    // MARK: - Configure
    
    func configure(with parameter: Parameters) {
        titleLabel.text = parameter.title
        switch parameter {
        case .title:
            addTextField(for: .title)
        case .price:
            addTextField(for: .price)
        case .nextBillingDate:
            addDatePicker()
        case .billingCycle:
            addBillingCycleButton()
        case .alert:
            addAlertButton()
        }
    }
}

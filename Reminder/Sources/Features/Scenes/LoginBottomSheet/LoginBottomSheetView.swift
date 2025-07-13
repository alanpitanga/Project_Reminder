//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Alan Pitanga on 27/02/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.lable.title".localized
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metrics.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "login.email.label".localized
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = Metrics.tiny
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let stackTwo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metrics.small
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "login.password.label".localized
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.isSecureTextEntry = true
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 8
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = .white
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        self.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(stackOne)
        scrollView.addSubview(stackTwo)
        stackOne.addArrangedSubview(emailLabel)
        stackOne.addArrangedSubview(emailTextField)
        stackTwo.addArrangedSubview(passwordLabel)
        stackTwo.addArrangedSubview(passwordTextField)
        scrollView.addSubview(loginButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Metrics.medium),
            
            stackOne.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            stackOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            stackOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            stackTwo.topAnchor.constraint(equalTo: stackOne.bottomAnchor, constant: Metrics.medium),
            stackTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            stackTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: stackTwo.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -14)
            
        ])
    }
    
    @objc
     private func loginButtonDidTapped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        delegate?.sendLogin(user: user, password: password)
        
    }
}
